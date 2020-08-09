class Photo < ApplicationRecord

	attachment :image

	belongs_to :user

end
