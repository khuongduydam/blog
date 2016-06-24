class Article < ActiveRecord::Base
	validate :title_is_shorter_than_body
	scope :body_includes,	->(body) {where('body LIKE ?', "%#{body}%")}

	def title_is_shorter_than_body
		return if title.blank? or body.blank?
		if body.length < title.length
			errors.add(:body, "can\'t be shorter than title")
		end
	end
end
