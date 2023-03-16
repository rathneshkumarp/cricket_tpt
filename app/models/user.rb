class User < ApplicationRecord
    
    validates :name, presence: true, uniqueness: { error: "Name Should be unique"}
    validates :password,  presence: true, confirmation: true, length: {maximum: 8 }
    validates :email, presence: :true, uniqueness: { error: "Email Should be unique"}
end
