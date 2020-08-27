class Recipe < ApplicationRecord
	belongs_to :User
	belongs_to :genre
	attachment :image
end
