class User < ActiveRecord::Base
  validates :login, uniqueness: true
  validates_presence_of :name, :last_name, :login, :email, :password
end
