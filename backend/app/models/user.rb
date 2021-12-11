class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader  
  has_many :posts, dependent: :destroy
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :omniauthable,
         omniauth_providers: [:google_oauth2],
         jwt_revocation_strategy: JwtDenylist

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])
    unless user
      user = User.create(username: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end       
end