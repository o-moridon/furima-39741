class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                  presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "must include both letters and numbers" }
  validates :password_confirmation,     presence: true
  validates :family_name,
    format: { with: /\A[ぁ-ゔァ-ヴ一-龠々ー]+\z/, message: "can't be half-width characters" },
    presence: true
  validates :first_name,
    format: { with: /\A[ぁ-ゔァ-ヴ一-龠々ー]+\z/, message: "can't be half-width characters"},
    presence: true
  validates :family_name_kana,
    format: { with: /\A([ァ-ン]|ー)+\z/, message: "can't be full-width characters"},
    presence: true
  validates :first_name_kana,
    format: { with: /\A([ァ-ン]|ー)+\z/, message: "can't be full-width characters"},
    presence: true
  validates :birthday,
    presence: true

end
