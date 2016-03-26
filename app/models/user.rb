class User < ActiveRecord::Base
    has_many :items
    attr_accessor :password
    before_save :encrypt_password
    before_destroy :list_check
    
    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, salt)
        end
    end
    
    def self.authenticate(name, password)
        user = find_by_name(name)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.salt)
            user
        else
            nil
        end
    end
    
    def list_check
        if !self.deletable?
          raise "You have fixtures that are still borrowing."
        end
    end
    
    def deletable?
        self.items.count == 0
    end
end
