class Machine < ApplicationRecord
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_snack_price
    snacks.average(:price)
  end

  def snack_count
    snacks.count
  end
end
