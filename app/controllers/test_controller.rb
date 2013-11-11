class TestController < ApplicationController
	before_action :set_graph, only: [:facebook, :info]
	before_action :set_twitter, only: [:twitter]
	require 'twitter'
	
  def facebook
  	@profile = @graph.get_object("me")
  	@picture = @graph.get_picture("me")
  	@uid =  @profile["id"]
  	@feed = @graph.fql_query("select status_id, message, comment_info, like_info from status where uid = #{@uid.to_s}")
  	@friends = @graph.get_connections("me", "friends")
  end
  
  def info
  	@objectid = params[:objectid]
  	@type = params[:type]
  	if @type == "comment"
			@info = @graph.get_connections(@objectid, "comments")
		else
			@info = @graph.get_connections(@objectid, "likes")
		end
  end
  
  def twitter
  	@profile = @client.users(Integer(@curuserid))
  	@timeline = @client.user_timeline
  end
  
  def callback
  	@auth = request.env['omniauth.auth']
  end
  
  private
  	def set_graph
  		if current_user.authentications.exists?(:provider => "facebook")
  			fbtoken = current_user.authentications.find_by_provider("facebook").token
  			@graph = Koala::Facebook::API.new(fbtoken)
  		else
  			redirect_to "/auth/facebook"
  		end
  	end
  	def set_twitter
  		if current_user.authentications.exists?(:provider => "twitter")
				@twtoken = current_user.authentications.find_by_provider("twitter").token
				@oauthsecret = current_user.authentications.find_by_provider("twitter").oauth_secret
				@curuserid = current_user.authentications.find_by_provider("twitter").uid
				@client = Twitter::Client.new(
					:oauth_token => @twtoken,
					:oauth_token_secret => @oauthsecret
				)
			else
				redirect_to "/auth/twitter"
  		end
  	end
end
