class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates [ :nick_name, :family_name, :first_name, :family_name_kana,:first_name_kana, :birthday ], presence: true
  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'must include both letters and numbers'
end