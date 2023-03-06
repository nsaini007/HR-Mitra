class EmailValidator < ActiveModel::Validator
    def validate
        unless self.personal_email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            self.errors.add( :personal_email, "Not a valid Email")
        end
    end
end