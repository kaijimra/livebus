class BusesController < ApplicationController
  before_action :require_user_logged_in

  def index
      @pagy, @buses = pagy(Bus.order(id: :asc))
  end

  def show
    @bus = Bus.find(params[:id])
    @pagy, @stops= pagy(Stop.order(id: :asc))
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      flash[:success] = 'バス便を追加しました。'
      redirect_to @bus
    else
      @pagy, @buses = pagy(Bus.order(id: :desc))
      flash.now[:danger] = 'バス便の追加に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])

    if @bus.update(bus_params)
      flash[:success] = 'バス便名は正常に更新されました'
      redirect_to @bus
    else
      flash.now[:danger] = 'バス便名は更新されませんでした'
      render :edit
    end
  end

  private

  def bus_params
    params.require(:bus).permit(:name)
  end
end
