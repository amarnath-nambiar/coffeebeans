# frozen_string_literal: true

module Iterable
  class CreateUser < Iterable::Base
    attr_reader :params

    def initialize(params)
      puts params
      @params = params
      @event_type = params['event_type']
      @user_id = params['user_id']
    end

    def call
      create_event(@event_type, @user_id)
    end

    private

    def create_event(event_type, user_id)
      payload = {
        email: 'user1@email.com',
        userId: user_id,
        eventName: event_type,
        id: 'string',
        createdAt: Time.now.to_i,
        dataFields: {},
        campaignId: 0,
        templateId: 0,
        createNewFields: true
      }
      url = "#{base_url}/api/events/track"
      puts payload
      response = HTTParty.post(url, body: payload.to_json, headers:headers )
      handle_response(response)
    end

    def headers
      {
        'Content-Type' => 'application/json',
        'Api-Key' => IterableApi.api_key
      }
    end

    def handle_response(response)
      JSON.parse(response.body)
    end
  end
end
