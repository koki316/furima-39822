class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,        presence: true
  validates :firstname,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一\p{Han}]+\z/ }
  validates :lastname,        presence: true, format: { with: /\A[ぁ-んァ-ヶ一\p{Han}]+\z/ }
  validates :firstname_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :lastname_kana,   presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,        presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数を両方含む必要があります"}
  
  
end
