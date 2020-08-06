class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  validates :nickname, :family_name, :first_name, 
            :family_name_kana, :first_name_kana, :birthday,
              presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
              uniqueness: true,
              format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./
  validates :password,
              format: { with: VALID_PASSWORD_REGEX,
                        message: "include both letters and numbers" }

  VALID_ZENKAKU_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  validates :family_name,
              format: { with: VALID_ZENKAKU_REGEX,
                        message: "Full-width characters" }
  validates :first_name,
              format: { with: VALID_ZENKAKU_REGEX,
                        message: "Full-width characters" }

  VALID_ZENKAKU_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  validates :family_name_kana,
              format: { with: VALID_ZENKAKU_KANA_REGEX,
                        message: "Full-width katakana characters"}
  validates :first_name_kana,
              format: { with: VALID_ZENKAKU_KANA_REGEX,
                        message: "Full-width katakana characters" }
  # //バリデーション

  # アソシエーション
  has_many :items
  # //アソシエーション
  
end
