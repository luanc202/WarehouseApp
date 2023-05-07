class Warehouse < ApplicationRecord
  has_many :stock_products

  validates :name, :city, :area, :code, :address, :cep, :description, presence: true
  validates :code, length: { is: 3 }, uniqueness: true

  def full_description
    "#{code} - #{name}"
  end
end
