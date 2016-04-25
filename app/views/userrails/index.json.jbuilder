json.array!(@userrails) do |userrail|
  json.extract! userrail, :id, :g, :scaffold, :user, :first_name, :last_name, :display_name, :email, :password_digest, :remember_token
  json.url userrail_url(userrail, format: :json)
end
