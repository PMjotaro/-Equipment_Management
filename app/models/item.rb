class Item < ActiveRecord::Base
    belongs_to :user
    
    def lend_to(user)
        self.user = user
        self.save
    end
    
    def give_back()
        self.user =nil
        self.save
    end
end
