class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Input full-width characters' } do
    validates :last_name
    validates :first_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true,
               format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
                         message: 'Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birth_date, presence: true
  
  has_many :items
end
