class User < ApplicationRecord
    #length of the user name
    validates :username, presence: true, 
              uniqueness: {case_sensitive: false} ,
              length: {minimum: 3 , maximum: 25}
    #use regular expressions Rubular.com
    VALID_EMAIL_REGEX= /\S+@\S+\.\S+/i
    validates :email, presence: true, 
              uniqueness: {case_sensitive: false} ,
              length: {minimum: 3 , maximum: 25} , 
              format: {with: VALID_EMAIL_REGEX}
end  