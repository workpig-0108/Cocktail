class Recipe < ApplicationRecord
	belongs_to :user
	has_many :genres
	attachment :image
end
