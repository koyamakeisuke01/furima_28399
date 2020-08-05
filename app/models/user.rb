class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :family_name, :first_name, 
            :family_name_kana, :first_name_kana, :birthday,
              presence: true

  validates :email,
              uniqueness: true,
              format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password,
              length: { minimum: 6 },
              format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./,
                        message: "include both letters and numbers" }
  validates :family_name,
              format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
                        message: "Full-width characters" }
                        
  validates :family_name_kana,
              format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/,
                        message: "Full-width katakana characters"}

  validates :first_name_kana,
              format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/,
                        message: "Full-width katakana characters" }

  validates :first_name,
              format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
                        message: "Full-width characters" }
end
