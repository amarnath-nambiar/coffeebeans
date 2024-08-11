# frozen_string_literal: true

# lib/iterable_api.rb

class IterableApi
  class << self
    attr_accessor :api_key, :api_url

    def configure
      yield self
    end
  end
end
