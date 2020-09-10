class Post < ApplicationRecord
	has_one_attached :image_file
	validates :caption, presence: true, length: {minimum: 3}
	validate :image_validation
	private
		def image_validation
			if image_file.attached? && !image_file.content_type.in?(%w(image/jpeg image/jpg image/png))
				errors.add(:image_file , 'File must be an image with extension jpeg/jpg/png')
			elsif !image_file.attached?
			 	errors.add(:image_file , ' must be attached')

			end
		end 
end
