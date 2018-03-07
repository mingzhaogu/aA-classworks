# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :overlapping_requests, on: :create

  belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    dependent: :destroy

    def overlapping_requests
      p "test"
      requests = CatRentalRequest.where(cat_id: cat_id)
        .where("'#{end_date}' <= cat_rental_requests.start_date AND '#{start_date}' <= cat_rental_requests.end_date")

      requests.empty?
    end

    def overlapping_approved_requests

    end

end
