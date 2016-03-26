class User < ActiveRecord::Base
    has_many :items
    attr_accessor :password
    before_save :encrypt_password
    
    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, salt)
        end
    end    
end
