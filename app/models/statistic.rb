class Statistic < ApplicationRecord
  require 'resolv'
  
  belongs_to :shortener

  validates :ip_address, 
            :presence => true,
            :format => { 
              :with => Resolv::AddressRegex 
            }
end
