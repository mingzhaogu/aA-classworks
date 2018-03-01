# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  topic      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  has_many :tags,
           primary_key: :id,
           foreign_key: :topic_id,
           class_name: :Tagging

  has_many :tagged_urls,
           through: :tags,
           source: :url

  def popular_links
    self.tagged_urls.sort_by(&:num_clicks).reverse.take(5)
  end
end
