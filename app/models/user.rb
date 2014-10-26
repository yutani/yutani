require 'valid_email'
class User < ActiveRecord::Base
  include ActiveModel::Validations
  has_secure_password

  validates :email,
    :presence =>    true,
    :uniqueness =>  { :case_sensitive => false },
    :email      =>  true

  validates :password,
    :presence =>    true,
    :length   =>    { :minimum => 6 }

  validates :password_confirmation,
    :presence =>    true,
    :length   =>    { :minimum => 6 }

  validates :first_name,
    :presence =>    true,
    :length   =>    { :maximum => 50 }

   validates :last_name,
    :presence =>    true,
    :length   =>    { :maximum => 50 }
end
