class User < ActiveRecord::Base
  #Don't forget to make a new attribute accessile by adding it to this list when you make a migration
  
  attr_accessible :email, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of     :password,
                            :on => :create
  validates_presence_of     :email
  validates_uniqueness_of   :email,
                            :on => :create
                            
  has_many  :events, :through => :signups
  has_many  :signups
  
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end