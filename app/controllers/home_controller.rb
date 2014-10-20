class HomeController < ApplicationController
	def index
		@images = Image.order("id DESC").limit(25)
	end

	def find_album
		@find_album = Album.where("name LIKE ?", "%#{params[:album_name]}%")
	end
end
