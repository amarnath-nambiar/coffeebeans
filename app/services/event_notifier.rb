
class EventNotifier < Iterable::Base
  attr_reader :params

  def initialize(params)
    @params = params
    @user_id = params[:user_id]
  end

  def call
    send_email_notification
  end

  private

  def send_email_notification
    body = {
      "campaignId": 0,
      "recipientEmail": 'user1@email.com',
      "recipientUserId": @user_id,
      "dataFields": {},
      "sendAt": 'string',
      "allowRepeatMarketingSends": true,
      "metadata": {}
    }
    url = "#{base_url}/api/email/target"
    response = HTTParty.post(url, body: body, headers:headers)
    handle_response(response)
  end

  private

  def headers
    {
      'Content-Type' => 'application/json',
      'Api-Key' => IterableApi.api_key
    }
  end

  def handle_response(response)
    # Handle the response from Iterable as needed
    unless response.success?
      # Handle error response
    end
    JSON.parse(response.body)
  end
end
