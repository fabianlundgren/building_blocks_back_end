class User < ApplicationRecord
  VALID_ROLES = ['admin', 'janitor', 'tenant']
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :role, inclusion: {in: VALID_ROLES, message: '%{value} is not a valid user role'}
end
