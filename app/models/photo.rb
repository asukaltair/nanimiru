class Photo < ApplicationRecord

	validates :image, presence:true

	attachment :image
	acts_as_taggable

	belongs_to :user

	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
