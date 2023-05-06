class Order < ApplicationRecord
  belongs_to :warehouse
  belongs_to :supplier
  belongs_to :user
  enum status: { pending: 0, delivered: 5, canceled: 9 }

  validates :code, :estimated_delivery_date, presence: true
  validate :estimated_delivery_date_is_future
  validates :code, uniqueness: true

  before_validation :generate_code

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(8).upcase
  end

  def estimated_delivery_date_is_future
    return unless self.estimated_delivery_date.present? && estimated_delivery_date <= Date.today

    errors.add(:estimated_delivery_date, 'deve ser futura')
  end
end
