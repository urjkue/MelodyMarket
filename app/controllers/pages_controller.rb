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
    @user_id = current_user.id
  #   user = User.find(@user_id)
  #   @email = user.email

  #   # Check if the user has booked this instrument
    @booking = Booking.find_by(user_id: @user_id, instrument_id: @ins.id)
    @reviews = Review.where(instrument_id: @ins.id).order(rating: :desc).limit(2)
  #     # User has booked the instrument, fetch reviews
  #   else
  #     # User has not booked the instrument, do something (redirect, show a message, etc.)
  #     flash[:alert] = "You must book this instrument to write a review and rate it."
  #     redirect_to root_path # Redirect to home or another appropriate path
  #   end
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


    @booking = Booking.new(
      user_id: @user.id,
      starting_date: @starting_date,
      ending_date: @ending_date,
      instrument_id: @instrument.id,
    )
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking was successfully created.'
    else

      render :booking
    end


  end

  def dashboard
    @user_dashboard_id = current_user.id
    @user_dashboard = User.find(@user_dashboard_id)
    @bookings = Booking.where(user_id: @user_dashboard_id)
    @reviews = Review.where(user_id: @user_dashboard_id)
  end

  def new_review
    @a = params[:comment]
    @rate = params[:rating]
    @ins_idd = params[:ins_id]
    @usr = params[:usr_id]
    @review = Review.new(
      comment: @a,
      rating: @rate,
      instrument_id: @ins_idd,
      user_id: @usr
    )
    if @review.save
      redirect_to dashboard_path, notice: 'review was successfully created.'
    else
      render :review
    end

  end

end
