class Post < ApplicationRecord
	has_one_attached :image_file
	validates :caption, presence: true, length: {minimum: 3} 
end
