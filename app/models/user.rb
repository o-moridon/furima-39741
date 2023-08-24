class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
  validates :nickname,                  presence: true
  validates :email,                     presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,                  presence: true, length: { minimum: 6 }
  validates :password_confirmation,     presence: true
  validates :family_name,               presence: true
  validates :first_name,                presence: true
  validates :family_name_kana,          presence: true
  validates :first_name_kana,           presence: true
  validates :birthday,                  presence: true

end
