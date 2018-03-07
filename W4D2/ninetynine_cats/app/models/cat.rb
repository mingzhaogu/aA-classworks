# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = %w(red orange yellow green blue indigo violet brown grey white black).freeze
  validates :color, presence: true, inclusion: { in: COLORS }
  validates :birth_date, presence: true
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F) }
  validates :description, presence: true

  has_many :cat_requests,
    class_name: :CatRentalRequest,
    foreign_key: :cat_id

  def age
    age = Date.today.year - birth_date.year
    age -= 1 if Date.today < birth_date + age.years
    age
  end
end
