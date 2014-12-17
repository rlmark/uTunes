class RatingsController < ApplicationController


def new
@rating = Rating.new(product_id: params[:id])
end

def create
  @rating = Rating.new(params.require(:rating).permit(:stars, :comments, :product_id))
  holder = params[:rating][:product_id]
  if @rating.save
    redirect_to product_path(@rating.product_id)
  else
    @rating = Rating.new(params.require(:rating).permit(:product_id))
    #render :new, :id => holder
    #render :new_rating
    redirect_to new_rating_path(holder)
    #render :action => "new", :id => holder
  end
end

end
