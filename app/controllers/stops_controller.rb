class StopsController < ApplicationController
  before_action :require_user_logged_in

  def index
      @pagy, @stops = pagy(Stop.order(id: :asc))
  end

  def new
    @stop = Stop.new
  end

  def show
      @pagy, @stops= pagy(Stop.order(id: :asc))
  end


  def create
    @stop = Stop.new(stop_params)
    if @stop.save
      flash[:success] = 'バス停を追加しました。'
      redirect_to root_url
    else
      @pagy, @stops = pagy(Stop.order(id: :asc))
      flash.now[:danger] = 'バス停の追加に失敗しました。'
      render 'toppages/index'
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

  private

  def stop_params
    params.require(:stop).permit(:name)
  end
end
