class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
  end

  def index
    @instruments = Instrument.all
  end


  def show
    @ins = Instrument.find(params[:id])
    @reviews = Review.where(instrument_id: @ins.id)
  end
  def category
    @instru = Instrument.where(category: params[:category])
  end
  def instrument
  end

  def booking
  end
end
