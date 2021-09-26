class StopsController < ApplicationController
  before_action :require_user_logged_in
  before_action :sim_time

  def index
    @pagy, @stops = pagy(Stop.order(id: :asc), items: 10)
  end

  def new
    @stop = Stop.new
  end

  def show
    @stop= Stop.find(params[:id])
  end

  def create
    @stop = Stop.new(stop_params)
    if @stop.save
      flash[:success] = 'バス停を追加しました。'
      redirect_to stops_url
    else
      @pagy, @stops = pagy(Stop.order(id: :asc), items: 10)
      flash.now[:danger] = 'バス停の追加に失敗しました。'
      render :new
    end
  end

  def edit
    @stop = Stop.find(params[:id])
  end

  def update
    @stop = Stop.find(params[:id])

    if @stop.update(stop_params)
      flash[:success] = 'バス停名は正常に更新されました'
      redirect_to @stop
    else
      flash.now[:danger] = 'バス停名は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    flash[:success] = 'バス停を削除しました。'
    redirect_to stops_url
  end

  private

  def stop_params
    params.require(:stop).permit(:name)
  end
end
