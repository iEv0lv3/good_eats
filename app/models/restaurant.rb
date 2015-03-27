class Restaurant < ActiveRecord::Base
  has_many :reviews

  validates :name,
    presence: true,
    length: { minimum: 5 }

  validates :city,
    presence: true

  validates :state,
    presence: true

  validates :zip,
    presence: true,
    length: { maximum: 10 }

end
