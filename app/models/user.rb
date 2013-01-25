class User
  include Mongoid::Document
  include Mongoid::Paperclip

  attr_accessor :password
  before_save :encrypt_password
  has_mongoid_attached_file :profile_picture

  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :name, :type => String
  field :fb_token, :type => String
  field :provider, :type => String
  field :profile_picture, :type => String
  field :cover_photo, :type => String
  field :is_suggessted, :type => Boolean
  field :facebook_id, :type => String
  field :bio, :type => String
  field :city, :type => String
  field :country, :type => String
  field :currunt_lat, :type => String
  field :current_long, :type => String
  field :gender, :type => String
  field :birthday, :type => Time
  field :website, :type => String
  field :mobile_no, :type => String
  field :twitter_id,:type => String
  field :is_active, :type => Boolean
  field :registration_id, :type => String
  field :last_login_time, :type => Time
  field :created_time, :type => Time
  field :deleted_time, :type => Time
  field :password_salt, :type => String
  field :password_hash, :type => String
  field :screen_name, :type => String

    def encrypt_password
    if password.present?
     self.password_salt = BCrypt::Engine.generate_salt
     self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    end
  end
    def self.authenticate(email, password)
    user = User.where(:email => email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
