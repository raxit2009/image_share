class Image < ActiveRecord::Base
	belongs_to :album
	belongs_to :user
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => '/noImage.png'
  	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  	 validate :maximum_uplaod

  	def maximum_uplaod
  		find_image = Image.where("album_id = ?", album_id)
  		unless find_image.length <= 25
  			errors.add("can not", "be uploaded more than 25 per Album.")
  		end

  	end
end
