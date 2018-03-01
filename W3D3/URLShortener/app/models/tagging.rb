# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  url_id     :integer          not null
#  topic_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagging < ApplicationRecord
  validates :url_id, presence: true
  validates :topic_id, presence: true

  belongs_to :url,
             class_name: :ShortenedUrl,
             foreign_key: :url_id,
             primary_key: :id

  belongs_to :topic,
             class_name: :TagTopic,
             foreign_key: :topic_id,
             primary_key: :id
end
