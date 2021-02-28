class User < ApplicationRecord

    before_save {self.email = email.downcase} #This function used to do changes to an attribute 
                                                #of an object before storing it in the database

    has_many :articles, dependent: :destroy

    validates :username, presence: true, 
                        uniqueness: {case_sensitive: false}, 
                        length: {mininum: 3, maximum: 25}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true,
                     uniqueness: {case_sensitive: false}, 
                     length: {maximum: 105},
                     format: {with: VALID_EMAIL_REGEX }

    has_secure_password
end