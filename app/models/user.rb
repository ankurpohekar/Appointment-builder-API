class User < ApplicationRecord
  has_secure_password validations: false

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_many :appointments
end