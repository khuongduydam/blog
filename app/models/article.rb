class Article < ActiveRecord::Base
	validate :title_is_shorter_than_body
	scope :title_includes,	-> (title) {where('title ILIKE ?', "%#{title}%")}

	def title_is_shorter_than_body
		return if title.blank? or body.blank?
		if body.length < title.length
			errors.add(:body, "can\'t be shorter than title")
		end
	end
	belongs_to :user
	has_many :comments, dependent: :destroy
end
