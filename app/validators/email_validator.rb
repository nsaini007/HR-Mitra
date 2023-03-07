class EmailValidator < ActiveModel::Validator
    def validate(record)
        unless record.personal_email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            record.errors.add( :personal_email, "Not a valid Email")
        end
    end
end