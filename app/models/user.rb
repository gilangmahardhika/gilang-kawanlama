class User < ApplicationRecord
  has_secure_password

  ROLES = ["Admin", "User"]

  validates_presence_of :email, :name, :role
  validates_inclusion_of :role, in: ROLES
end
