class Employee < ApplicationRecord
    validates :first_name, :last_name, presence: true
    validates :personal_email, presence: true, uniqueness: true
    validates :city, :state, :country, :pincode, :address_line_1, :address_line_2, presence: true
    validate :MyValidator
    #Not Working
    # validates_with EmailValidator

    private
    def MyValidator
        unless self.personal_email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            self.errors.add( :personal_email, "Not a valid Email")
        end
    end
end
