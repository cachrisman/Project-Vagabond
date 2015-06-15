json.array!(@log_posts) do |log_post|
  json.extract! log_post, :id, :title, :body, :user_id
  json.url log_post_url(log_post, format: :json)
end
