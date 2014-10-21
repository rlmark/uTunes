class RatingsController < ApplicationController


def new
@rating = Rating.new(product_id: params[:id])
end

def create
  @rating = Rating.new(params.require(:rating).permit(:stars, :comments, :product_id))
  if @rating.save
    redirect_to product_path(@rating.product_id)
  else
    render :new
  end
end

end

