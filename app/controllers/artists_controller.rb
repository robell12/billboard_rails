class ArtistsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist, except: [:index, :new, :create]

  def index
  	@artists = @billboard.artists
  end

  def show
  end

  def new
  	@artist = @billboard.artists.new
  end

  def edit
  end

  def create
    @artist = @billboard.artists.new(artist_params)
    if @artist.save
      redirect_to billboard_artist_path(@billboard, @artist)
    else
      render :new
    end
  end


	def update
	  if @artist.update(artist_params)
	    redirect_to billboard_artist_path(@billboard, @artist)
	  else
	    render :edit
	  end
	end

	def destroy
	  @artist.destroy
	  redirect_to artists_path(@billboard)
	end

  private
    def artist_params
      params.require(:artist).permit(:name, :genre,
                                    :rating, :bio)
    end

    def set_billboard
      @billboard = Billboard.find(params[:billboard_id])
    end

    def set_artist
      @artist = @billboard.artists.find(params[:id])
    end
end
