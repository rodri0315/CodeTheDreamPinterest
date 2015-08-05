class Pin < ActiveRecord::Base
	Paperclip.options[:command_path] = '/opt/ImageMagick/bin/identify'
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	#http://edgeguides.rubyonrails.org/active_record_validations.html#length
	#validations
	validates :image, presence: true
  validates :description, presence: true, length: { minimum: 2 }, length: { maximum: 99 }
end
