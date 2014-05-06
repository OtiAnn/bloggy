json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :picture
  json.url post_url(post, format: :json)
end
