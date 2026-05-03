require 'net/http'
require 'json'
require 'openssl'
require 'base64'

class CashfreeService
  SANDBOX_URL    = "https://sandbox.cashfree.com/pg"
  PRODUCTION_URL = "https://api.cashfree.com/pg"
  API_VERSION    = "2023-08-01"

  def initialize
    @app_id     = ENV['CASHFREE_APP_ID']
    @secret_key = ENV['CASHFREE_SECRET_KEY']
    @base_url   = ENV['CASHFREE_ENV'] == 'PRODUCTION' ? PRODUCTION_URL : SANDBOX_URL
  end

  # Creates an order on Cashfree and returns payment_session_id
  def create_order(order_id:, amount:, customer:, currency: "INR")
    response = post("/orders", {
      order_id: order_id,
      order_amount: amount.to_f.round(2),
      order_currency: currency,
      customer_details: {
        customer_id: customer[:id].to_s,
        customer_name: customer[:name].to_s,
        customer_email: customer[:email].to_s,
        customer_phone: customer[:phone].to_s
      }
    })
    response
  end

  # Fetches order status from Cashfree
  def get_order(cf_order_id)
    get("/orders/#{cf_order_id}")
  end

  # Verifies webhook signature from Cashfree
  def verify_webhook_signature(raw_body, timestamp, received_signature)
    data = "#{timestamp}#{raw_body}"
    computed = Base64.strict_encode64(
      OpenSSL::HMAC.digest("SHA256", @secret_key, data)
    )
    ActiveSupport::SecurityUtils.secure_compare(computed, received_signature.to_s)
  end

  private

  def headers
    {
      "Content-Type"    => "application/json",
      "x-api-version"   => API_VERSION,
      "x-client-id"     => @app_id,
      "x-client-secret" => @secret_key
    }
  end

  def post(path, body)
    uri     = URI("#{@base_url}#{path}")
    http    = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri)
    headers.each { |k, v| request[k] = v }
    request.body = body.to_json
    JSON.parse(http.request(request).body)
  rescue => e
    Rails.logger.error "CashfreeService POST error: #{e.message}"
    { "error" => e.message }
  end

  def get(path)
    uri     = URI("#{@base_url}#{path}")
    http    = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    headers.each { |k, v| request[k] = v }
    JSON.parse(http.request(request).body)
  rescue => e
    Rails.logger.error "CashfreeService GET error: #{e.message}"
    { "error" => e.message }
  end
end
