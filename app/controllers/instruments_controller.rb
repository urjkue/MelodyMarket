class InstrumentsController < ApplicationController
  def index
    @user = current_user
    @instruments = Instrument.all
  end

    def show
      @ins = Instrument.find(params[:id])
      @reviews = Review.where(instrument_id: @ins.id)
    end

  def new
  end

  def create
  end

  def find
  end

  def destroy
  end
  def category
    @instru = Instrument.where(category: params[:category])
  end
  def instrument
  end
end
