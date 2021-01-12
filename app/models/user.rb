class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, length: {minimum: 5, maximum: 20}, allow_blank: false



  def self.authenticate_with_credentials(email, password)
    stripped_email = email.strip.downcase
    @user = User.where("email = ?", stripped_email).first
    if @user && @user.authenticate(password)
      return @user
    end
       nil
    end
end
