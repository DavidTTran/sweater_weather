class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :api_key, uniqueness: true

  has_secure_password

  def create_key
    update(api_key: ApiGenerator.call)
  end
end
