class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must include both letters and numbers'
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name, :family_name
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
    validates :first_name_kana, :family_name_kana
  end
en