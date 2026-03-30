class StoreAdmin::ExpensesController < StoreAdmin::ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_store

  def index
    @expenses = @current_store.expenses
                            .includes(:created_by)
                            .recent
                            .page(params[:page])
                            .per(20)

    # Filter by date range if provided
    if params[:start_date].present? && params[:end_date].present?
      @expenses = @expenses.by_date_range(params[:start_date], params[:end_date])
    end

    # Filter by category if provided
    if params[:category].present?
      @expenses = @expenses.by_category(params[:category])
    end

    # Calculate totals
    @total_expenses = @current_store.expenses.sum(:amount)
    @monthly_expenses = @current_store.expenses
                                    .where(expense_date: Date.current.beginning_of_month..Date.current.end_of_month)
                                    .sum(:amount)

    # Category breakdown for current month
    @category_breakdown = @current_store.expenses
                                      .where(expense_date: Date.current.beginning_of_month..Date.current.end_of_month)
                                      .group(:category)
                                      .sum(:amount)
  end

  def show
  end

  def new
    @expense = @current_store.expenses.build
    @expense.expense_date = Date.current
  end

  def create
    @expense = @current_store.expenses.build(expense_params)
    @expense.created_by = current_user

    if @expense.save
      redirect_to store_admin_expenses_path, notice: 'Expense was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to store_admin_expense_path(@expense), notice: 'Expense was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
    redirect_to store_admin_expenses_path, notice: 'Expense was successfully deleted.'
  end

  private

  def set_expense
    @expense = @current_store.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:title, :description, :amount, :category, :expense_date)
  end

  def ensure_current_store
    redirect_to store_admin_root_path, alert: 'Access denied.' unless @current_store
  end
end