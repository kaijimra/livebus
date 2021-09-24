class BusesController < ApplicationController
  before_action :require_user_logged_in

  def index
      @pagy, @buses = pagy(Bus.order(id: :asc))
  end

  def show
    @bus = Bus.find(params[:id])
    @pagy, @stops= pagy(Stop.order(id: :asc))
    time_prev = "00:00"
    @stops.each do |s|
      plan = @bus.plans.find_or_create_by(stop_id: s.id)
      if time_prev > format_time(plan.arrv_time)
        flash.now[:danger] = '注意：時刻が昇順ではありません'
        break
      end
      time_prev = format_time(plan.dept_time)
    end
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      flash[:success] = 'バス便を追加しました。'
      redirect_to buses_url
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

  def destroy
    @bus = Bus.find(params[:id])
    @bus.destroy
    flash[:success] = 'バス便を削除しました。'
    redirect_to buses_url
  end

  private

  def bus_params
    params.require(:bus).permit(:name)
  end
end
