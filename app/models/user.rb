class User < ActiveRecord::Base
    has_many :treks
    has_secure_password
    validates_presence_of :username, :email
end