class ListsController < ApplicationController
   # Action to display all lists
   def index
    @lists = List.all
  end

  # Action to display details of a specific list
  def show
    @list = List.find(params[:id])
  end

  # Action to render form for creating a new list
  def new
    @list = List.new
  end

  # Action to create a new list
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  # Strong parameters for list creation
  def list_params
    params.require(:list).permit(:name)
  end
end
