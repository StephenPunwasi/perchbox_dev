Twitter.configure do |config|
  config.consumer_key = 'qX4dXTrv32Kf2xx3gfyL6g'
  config.consumer_secret = '5TUr2DWZBY1nAWVPFeS0pC2pRdDzIpzUgVW57IsBjtU'
end

TweetStream.configure do |config|
	config.consumer_key = 'qX4dXTrv32Kf2xx3gfyL6g'
  config.consumer_secret = '5TUr2DWZBY1nAWVPFeS0pC2pRdDzIpzUgVW57IsBjtU'
  config.auth_method = :oauth
end
