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
    @starting_date = Date.parse(params[:starting_date])
    @ending_date = Date.parse(params[:ending_date])
    @input_value = params[:input_value]
    @instrument = Instrument.find(params[:instrument_id])
    @number_of_days = (@ending_date - @starting_date).to_i
  end
end
