# frozen_string_literal: true

module EventsHelper
  def generate_random_user_id
    SecureRandom.uuid
  end
end
