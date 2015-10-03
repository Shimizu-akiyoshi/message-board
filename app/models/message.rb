class Message < ActiveRecord::Base
    validates :name , length: { maximum: 20 } , presence: true
    validates :body , length: { minumum: 2, maximum: 30 } , presence: true
end
