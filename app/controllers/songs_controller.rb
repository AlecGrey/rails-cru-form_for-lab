class SongsController < ApplicationController

    before_action :find_song, only: [:show, :edit, :update]
    before_action :new_song, only: [:new]

    def index
        @songs = Song.all
    end

    def show
    end

    def new
    end

    def create
        @song = Song.new(sanitized_params)

        if @song.save
            redirect_to song_path(@song)
        else
            render new_song_path
        end
    end

    def edit
        render new_song_path
    end

    def update
        if @song.update(sanitized_params)
            redirect_to song_path(@song)
        else
            render new_song_path
        end
    end

    private

    def find_song
        @song = Song.find(params[:id])
    end

    def new_song
        @song = Song.new
    end

    def sanitized_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end

end
