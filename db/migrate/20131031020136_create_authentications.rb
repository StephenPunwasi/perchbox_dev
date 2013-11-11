class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :token
      t.string :oauth_secret
      t.string :uid

      t.timestamps
    end
  end
end
