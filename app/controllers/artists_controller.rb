class ArtistsController < ApplicationController

    before_action :find_artist, only: [:show, :edit, :update]
    before_action :new_artist, only: [:new]

    def index
        @artists = Artist.all
    end

    def show
    end

    def new
    end

    def create
        @artist = Artist.new(sanitized_params)

        if @artist.save
            redirect_to artist_path(@artist)
        else
            render new_artist_path
        end
    end

    def edit
        render new_artist_path
    end

    def update
        if @artist.update(sanitized_params)
            redirect_to artist_path(@artist)
        else
            render new_artist_path
        end
    end

    private

    def find_artist
        @artist = Artist.find(params[:id])
    end

    def new_artist
        @artist = Artist.new
    end

    def sanitized_params
        params.require(:artist).permit(:name, :bio)
    end

end
