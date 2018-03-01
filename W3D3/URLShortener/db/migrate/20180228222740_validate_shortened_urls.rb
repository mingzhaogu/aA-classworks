class ValidateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    change_column_null :shortened_urls, :short_url, false
    change_column_null :shortened_urls, :long_url, false
    change_column_null :shortened_urls, :creator_id, false 
  end
end
