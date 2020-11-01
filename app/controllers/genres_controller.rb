class GenresController < ApplicationController

    before_action :find_genre, only: [:show, :edit, :update]
    before_action :new_genre, only: [:new]
    
    def index
        @genres = Genre.all
    end

    def show
    end

    def new
    end

    def create
        @genre = Genre.new(sanitized_params)

        if @genre.save
            redirect_to genre_path(@genre)
        else
            render new_genre_path
        end
    end

    def edit
        render new_genre_path
    end

    def update
        if @genre.update(sanitized_params)
            redirect_to genre_path(@genre)
        else
            render new_genre_path
        end
    end

    private

    def find_genre
        @genre = Genre.find(params[:id])
    end

    def new_genre
        @genre = Genre.new
    end

    def sanitized_params
        params.require(:genre).permit(:name)
    end

end
