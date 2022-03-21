class Portfolio < ApplicationRecord
    has_many :technologies
    #allows to create new instantes of Technoloy from Portfolio
    #use technologies_attributes: [{name: "Ruby"}, {name: "foo"}, {name: "bar"}] to create 3 new technologies named Ruby, foo, bar
    accepts_nested_attributes_for :technologies, #accepts if att:name is not blank
                                    reject_if: lambda { |attrs| attrs['name'].blank? }

    include Placeholder
    validates_presence_of :title, :body, :main_image, :thumb_image

    #Custom scopes
    def self.angular
        where(subtitle: "Angular")
    end
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on rails") }

    #setting default values when Portfolio.new is called
    after_initialize :set_defaults

    def set_defaults    # ||= if attribute == nil, set following value to the attribute
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
    
end
