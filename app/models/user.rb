class User
  include ActiveModel::SecurePassword
  include ActiveModel::Validations
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  has_one :basket

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true

  before_save { self.email = email.downcase }
  has_secure_password
end
