class Location < ActiveRecord::Base
  acts_as_superclass
  include PublicActivity::Common 
end