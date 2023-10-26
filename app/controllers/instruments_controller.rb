class InstrumentsController < ApplicationController
  def index
    @instrument = Instrument.all
  end

  def show
    def show
      @ins = Instrument.find(params[:id])
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
end
