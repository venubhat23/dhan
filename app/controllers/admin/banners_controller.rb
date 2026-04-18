class Admin::BannersController < Admin::ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy, :toggle_status]
  skip_before_action :verify_authenticity_token, only: [:upload_cloudinary_image]

  # GET /admin/banners
  def index
    @banners = Banner.includes(banner_image_attachment: :blob)
                    .order(:display_order, :created_at)
                    .page(params[:page]).per(25)

    # Filter by status if specified
    case params[:status]
    when 'active'
      @banners = @banners.active
    when 'inactive'
      @banners = @banners.inactive
    when 'current'
      @banners = @banners.current
    end

    # Filter by location if specified
    if params[:location].present?
      @banners = @banners.by_location(params[:location])
    end

    # Statistics for dashboard cards
    @stats = {
      total_banners: Banner.count,
      active_banners: Banner.active.count,
      current_banners: Banner.current.count,
      expired_banners: Banner.where('display_end_date < ?', Date.current).count
    }
  end

  # GET /admin/banners/1
  def show
  end

  # GET /admin/banners/new
  def new
    @banner = Banner.new
    @banner.display_start_date = Date.current
    @banner.display_end_date = 1.month.from_now
    @banner.display_order = (Banner.maximum(:display_order) || 0) + 1
  end

  # GET /admin/banners/1/edit
  def edit
  end

  # POST /admin/banners
  def create
    @banner = Banner.new(banner_params)

    if @banner.save
      redirect_to admin_banner_path(@banner), notice: 'Banner was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/banners/1
  def update
    if @banner.update(banner_params)
      redirect_to admin_banner_path(@banner), notice: 'Banner was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/banners/1
  def destroy
    @banner.destroy
    redirect_to admin_banners_path, notice: 'Banner was successfully deleted.'
  end

  # PATCH /admin/banners/1/toggle_status
  def toggle_status
    @banner.update(status: !@banner.status)
    status_text = @banner.status? ? 'activated' : 'deactivated'
    redirect_to admin_banners_path, notice: "Banner was successfully #{status_text}."
  end

  # POST /admin/banners/upload_cloudinary_image
  def upload_cloudinary_image
    Rails.logger.info "=== BANNER CLOUDINARY UPLOAD START ==="
    Rails.logger.info "Params received: #{params.inspect}"
    Rails.logger.info "Image param present: #{params[:image].present?}"
    Rails.logger.info "Image param class: #{params[:image].class}" if params[:image].present?
    Rails.logger.info "Request content type: #{request.content_type}"
    Rails.logger.info "Request headers: #{request.headers.to_h.select { |k,v| k.start_with?('HTTP_') || k == 'CONTENT_TYPE' }}"

    respond_to do |format|
      if params[:image].present?
        begin
          Rails.logger.info "Image file details:"
          Rails.logger.info "  Original filename: #{params[:image].original_filename}"
          Rails.logger.info "  Content type: #{params[:image].content_type}"
          Rails.logger.info "  Size: #{params[:image].size} bytes"
          Rails.logger.info "  Tempfile path: #{params[:image].tempfile.path}"

          Rails.logger.info "Starting Cloudinary upload..."

          result = Cloudinary::Uploader.upload(
            params[:image].tempfile,
            folder: 'banners',
            public_id: "banner-temp-#{SecureRandom.hex(8)}",
            overwrite: true,
            resource_type: :auto,
            transformation: [
              { width: 1200, height: 600, crop: :limit, quality: :auto, fetch_format: :auto }
            ]
          )

          Rails.logger.info "Cloudinary upload successful!"
          Rails.logger.info "  Public ID: #{result['public_id']}"
          Rails.logger.info "  Secure URL: #{result['secure_url']}"
          Rails.logger.info "  Dimensions: #{result['width']}x#{result['height']}"

          thumbnail_url = Cloudinary::Utils.cloudinary_url(
            result['public_id'],
            width: 300,
            height: 150,
            crop: :fill
          )

          format.json {
            render json: {
              success: true,
              public_id: result['public_id'],
              url: result['secure_url'],
              thumbnail_url: thumbnail_url,
              width: result['width'],
              height: result['height'],
              format: result['format']
            }
          }
        rescue => e
          Rails.logger.error "=== CLOUDINARY UPLOAD ERROR ==="
          Rails.logger.error "Error: #{e.message}"
          Rails.logger.error "Error class: #{e.class}"
          Rails.logger.error "Error backtrace:"
          e.backtrace.first(10).each { |line| Rails.logger.error "  #{line}" }

          format.json {
            render json: {
              success: false,
              error: "Upload failed: #{e.message}",
              error_class: e.class.to_s
            }, status: :unprocessable_entity
          }
        end
      else
        Rails.logger.error "No image file provided in params"
        Rails.logger.error "Available params keys: #{params.keys}"

        format.json {
          render json: {
            success: false,
            error: "No image file provided",
            available_params: params.keys
          }, status: :bad_request
        }
      end
    end

    Rails.logger.info "=== BANNER CLOUDINARY UPLOAD END ==="
  end

  private

  def set_banner
    @banner = Banner.find(params[:id])
  end

  def banner_params
    params.require(:banner).permit(
      :title, :description, :redirect_link, :display_start_date, :display_end_date,
      :display_location, :status, :display_order, :banner_image, :image_url
    )
  end
end