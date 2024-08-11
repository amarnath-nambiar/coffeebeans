# frozen_string_literal: true

iterable_config = Rails.application.secrets

IterableApi.configure do |config|
  config.api_key = iterable_config['api_key']
  config.api_url = iterable_config['iteratable_url']
end
