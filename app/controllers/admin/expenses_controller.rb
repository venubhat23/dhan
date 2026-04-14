class Admin::ExpensesController < Admin::ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = Expense.includes(:store, :created_by).recent.page(params[:page]).per(20)

    # Filter by date range if provided
    if params[:start_date].present? && params[:end_date].present?
      @expenses = @expenses.by_date_range(params[:start_date], params[:end_date])
    end

    # Filter by category if provided
    if params[:category].present?
      @expenses = @expenses.by_category(params[:category])
    end

    # Filter by store or main inventory if provided
    if params[:store_id].present?
      if params[:store_id] == 'main_inventory'
        @expenses = @expenses.main_inventory
      else
        @expenses = @expenses.where(store_id: params[:store_id])
      end
    end

    # Calculate totals across all stores
    @total_expenses = Expense.sum(:amount)
    @monthly_expenses = Expense.where(expense_date: Date.current.beginning_of_month..Date.current.end_of_month)
                              .sum(:amount)

    # Category breakdown for current month across all stores
    @category_breakdown = Expense.where(expense_date: Date.current.beginning_of_month..Date.current.end_of_month)
                                .group(:category)
                                .sum(:amount)

    # Store-wise breakdown for current month (including Main Inventory)
    store_expenses = Expense.joins(:store)
                           .where(expense_date: Date.current.beginning_of_month..Date.current.end_of_month)
                           .group('stores.name')
                           .sum(:amount)

    main_inventory_total = Expense.main_inventory
                                 .where(expense_date: Date.current.beginning_of_month..Date.current.end_of_month)
                                 .sum(:amount)

    @store_breakdown = store_expenses
    @store_breakdown['Main Inventory'] = main_inventory_total if main_inventory_total > 0

    # Get all stores for filter dropdown
    @stores = Store.active.order(:name)
  end

  def show
  end

  def new
    @expense = Expense.new
    @stores = Store.active.order(:name)
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.created_by = current_user

    # Handle Main Inventory selection
    if params[:expense][:store_id] == 'main_inventory'
      # Find or create a special store for main inventory expenses
      main_inventory_store = Store.find_or_create_by(name: 'Main Inventory - Administrative') do |store|
        store.address = 'Central Administrative Office'
        store.city = 'Administrative'
        store.state = 'N/A'
        store.pincode = '000000'
        store.contact_person = 'System Admin'
        store.contact_mobile = '0000000000'
        store.email = ''
        store.status = true
      end

      @expense.store_id = main_inventory_store.id
      @expense.is_main_inventory = true
    end

    if @expense.save
      redirect_to admin_expenses_path, notice: 'Expense was successfully created.'
    else
      @stores = Store.active.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to admin_expense_path(@expense), notice: 'Expense was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    store_name = @expense.store.name
    @expense.destroy
    redirect_to admin_expenses_path, notice: "Expense from #{store_name} was successfully deleted."
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:title, :description, :amount, :category, :expense_date, :store_id)
  end
end