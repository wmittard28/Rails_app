class User < ActiveRecord::Base

    has_secure_password
    has_many :projects
    has_many :notes
    has_many :tags

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :username, presence: true



    def self.from_omniauth(auth)
        @user = User.find_or_create_by(:uid => auth[:uid]) do |user|
          if !User.find_by(:username => auth[:info][:username])
            user.username = auth[:info][:first_name]
          else
            user.username = auth[:info][:username] + auth[:uid]
          end
          user.email = auth[:info][:email]
          user.password = SecureRandom.hex
        end
    end
end 
