# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  creator_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, :creator_id, presence: true

  belongs_to :submitter,
             primary_key: :id,
             foreign_key: :creator_id,
             class_name: :User

  has_many :visits,
           primary_key: :id,
           foreign_key: :url_id,
           class_name: :Visit

  has_many :visitors,
           through: :visits,
           source: :users

  has_many :unique_visitors,
           -> { distinct },
           through: :visits,
           source: :users

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while self.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.shorten(user, long_url)
    code = self.random_code
    self.create!(long_url: long_url, short_url: code, creator_id: user.id)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.unique_visitors.count
  end

  def num_recent_uniques
    self.unique_visitors.where("visits.created_at > ?", Time.now - 10.minutes).count
  end
end
