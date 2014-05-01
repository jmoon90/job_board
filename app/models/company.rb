class Company < ActiveRecord::Base
  validates :link, presence: true
  validates :name, presence: true
end
