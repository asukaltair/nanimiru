class Comment < ApplicationRecord

	validates :comment, presence: true,
						length: { maximum: 140 }


	belongs_to :user
	belongs_to :photo

	validates :star, numericality: {
		less_than_or_equal_to: 5,
		greater_than_or_equal_to: 1
	}, presence: true

end
