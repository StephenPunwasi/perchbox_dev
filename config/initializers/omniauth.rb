Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '324632954344822', '091083c2e16556b93edd0b3d872e4eb7',
  	:scope => 'read_stream', :display => 'popup'
  provider :twitter, 'qX4dXTrv32Kf2xx3gfyL6g', '5TUr2DWZBY1nAWVPFeS0pC2pRdDzIpzUgVW57IsBjtU',
  	:display => 'popup'
end
