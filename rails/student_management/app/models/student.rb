class Student < ApplicationRecord
    validates :full_name, presence: true
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :email, presence: true, uniqueness: true
end
