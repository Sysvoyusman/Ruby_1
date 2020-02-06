class User < ApplicationRecord
    #whatever articles this user have it will destroy these articles if the user gets destroyed
    has_many :articles , dependent: :destroy
    before_save { self.email = email.downcase} #before user hots the database it will check for this
    
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
    #should be there before user gets created
    has_secure_password
end  