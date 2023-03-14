class Employee < ApplicationRecord
    has_many :documents

    validates :first_name, :last_name, presence: true
    validates :personal_email, presence: true, uniqueness: true
    validates :city, :state, :country, :pincode, :address_line_1, presence: true
    # validate :email_validator
    
    #validator in other class
    validates_with EmailValidator

    def name
        return "#{first_name} #{last_name}".strip
    end

    def full_address
        return "#{address_line_1} #{city} #{state} #{country} #{pincode}".strip
    end

    def name_with_email
        return "#{name}(#{personal_email})".strip        
    end

    private
    def email_validator
        unless self.personal_email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            self.errors.add( :personal_email, "Not a valid Email")
        end
    end
end
