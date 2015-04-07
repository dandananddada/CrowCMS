class Home::AlbumController < HomeController
	
	def list
		@albums = Admin::Album.all
		respond_to do |format|
			format.html { render :template => "home/album" }
		end		
	end

	def show
		@album = Admin::Album.find(params[:id])
		@photos = Admin::Photo.where("album_id = ?", params[:id])
		# @photos = Admin::Photo.photos_for_album(params[:id])
		respond_to do |format|
			format.html { render :template => "home/photo" }
		end
	end
end
