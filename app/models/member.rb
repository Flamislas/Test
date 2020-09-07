class Member < ApplicationRecord
    validates :name, :last_name, :date, :presence => true
end
