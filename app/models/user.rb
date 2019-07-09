class User < ApplicationRecord
  devise :database_authenticatable, :confirmable,
         :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :comments, dependent: :destroy
end
