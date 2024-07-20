class User < ApplicationRecord
  devise :database_authenticatable, :timeoutable, :omniauthable, omniauth_providers: [:google]

  def self.from_omniauth(access_token)
    data = access_token.info
    email = data['email']
    user = User.find_by(email:)
    unless user
      password = Devise.friendly_token[0, 20]
      user = User.create(email:,
                         password:, password_confirmation: password)
    end
    user
  end
end
