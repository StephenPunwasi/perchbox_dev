json.array!(@authentications) do |authentication|
  json.extract! authentication, :user_id, :provider, :uid, :token, :oauth_secret
  json.url authentication_url(authentication, format: :json)
end
