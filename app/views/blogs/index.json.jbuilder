json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :photo, :post
  json.url blog_url(blog, format: :json)
end
