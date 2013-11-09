class Authentication < ActiveRecord::Base
	belongs_to :user
	
	devise :database_authenticatable, :registerable, :omniauthable,
		:recoverable, :rememberable, :trackable, :validatable
end
