class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :nickname,                  presence: true
  validates :password, format: { with:VALID_PASSWORD_REGEX }
  validates :family_name,
    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "に半角は使えません" },
    presence: true
  validates :first_name,
    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "に半角は使えません"},
    presence: true
  validates :family_name_kana,
    format: { with: /\A[ァ-ヶー]+\z/u, message: "はカタカナで入力してください"},
    presence: true
  validates :first_name_kana,
    format: { with: /\A[ァ-ヶー]+\z/u, message: "はカタカナで入力してください"},
    presence: true
  validates :birthday,
    presence: true

end
