class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  belongs_to :state

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
end
