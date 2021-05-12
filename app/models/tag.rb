class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :saizy, through: :taggings
end
