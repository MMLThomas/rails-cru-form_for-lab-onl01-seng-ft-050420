class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
        @genre = Genre.find(@song.genre_id)
        @artist = Artist.find(@song.artist_id)
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(strong_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.update(strong_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end


    def strong_params(*args)
        params.require(:song).permit(*args)
    end
end
