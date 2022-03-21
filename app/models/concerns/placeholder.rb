module Placeholder
    # A helper to help implementing less strings as hard code values
    extend ActiveSupport::Concern

    def self.image_generator(height:, width:)
        "https://via.placeholder.com/#{height}x#{width}"
    end
end