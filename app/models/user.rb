class User < ApplicationRecord
  devise :database_authenticatable, :confirmable,
         :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[facebook]

end
