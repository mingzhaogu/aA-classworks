# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  visitor_id :integer          not null
#  url_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visit < ApplicationRecord
  validates :visitor_id, :url_id, presence: true

  belongs_to :users,
             primary_key: :id,
             foreign_key: :visitor_id,
             class_name: :User

  belongs_to :sites,
             primary_key: :id,
             foreign_key: :url_id,
             class_name: :ShortenedUrl

  def self.record_visit!(user, shortened_url)
    self.create!(visitor_id: user.id, url_id: shortened_url.id)
  end
end
