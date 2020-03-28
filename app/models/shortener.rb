class Shortener < ApplicationRecord
  has_many :statistics

  validates :url, 
            :presence => true
            
  validates :code, 
            :presence => true,
            :format => {
              :with => /\A(?=.*[a-z])[a-z\d]+\Z/i
            }
end
