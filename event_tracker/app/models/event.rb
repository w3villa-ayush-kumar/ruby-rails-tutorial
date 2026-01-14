class Event < ApplicationRecord
    validates :name, :location, :event_date, presence: true
end
