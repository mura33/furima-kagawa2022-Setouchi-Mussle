class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
            :email, presence: true,unique: true              
            :encrypted_password, presence: true,unique: true 
            :last_name, presence: true           
            :first_name, presence: true          
            :last_name_kana, presence: true       
            :first_name, presence: true
            :birth_date, presence: true
end
