class Member < ApplicationRecord
  validates :name, :last_name, :date, :presence => true

  def self.search(search)
    members = Member.where("name ILIKE ? OR last_name ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
