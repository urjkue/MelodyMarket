class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    def show
      @ins = Instrument.find(params[:id])
      @reviews = Review.where(instrument_id: @ins.id)
    end
  end

  def new
  end

  def create
  end

  def find
  end

  def destroy
  end
  def cate
    @instru = Instrument.where(category: params[:category])
  end
end
