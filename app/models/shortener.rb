class Shortener < ApplicationRecord
  has_many :statistics

  validates :url, 
            :presence => true,
            url: {
              no_local: true
            }
            
  validates :code, 
            :presence => true,
            :uniqueness => true,
            :format => {
              :with => /\A(?=.*[a-z])[a-z\d-]+\Z/i
            }
end
