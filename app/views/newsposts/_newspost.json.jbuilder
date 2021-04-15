json.extract! newspost, :id, :title, :content, :view_count, :user,news_id, :created_at, :updated_at
json.url newspost_url(newspost, format: :json)
