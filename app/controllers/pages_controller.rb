class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
   before_action :authenticate_user!

  def home
  end

  def index
    @instruments = Instrument.all
  end


  def show

    @ins = Instrument.find(params[:id])
   @reviews = Review.where(instrument_id: @ins.id).order(rating: :desc).limit(2)
    @id = @ins.id
    @user_id = current_user.id
    user = User.find(@user_id)
    @email = user.email
  end
  def category
    @instru = Instrument.where(category: params[:category])
  end
  def instrument
  end

  def booking
    @user = User.find(params[:user_id])
  end
end
