class PlansController < ApplicationController
  before_action :require_user_logged_in

  def create
  end

  def show
  end

  def edit
    @plan = Plan.find(params[:id])
    @plan.arrv_time = format_time(@plan.arrv_time)
    @plan.dept_time = format_time(@plan.dept_time)
  end

  def update
    @plan = Plan.find(params[:id])

    if !(params[:plan][:arrv_time].to_time && params[:plan][:dept_time].to_time)
      flash.now[:danger] = '正しい時刻を入力してください。'
      render_edit
    elsif params[:plan][:arrv_time].to_time > params[:plan][:dept_time].to_time
      flash.now[:danger] = '到着時刻より後に発車時刻にしてください。'
      render_edit
    elsif @plan.update(plan_params)
      flash[:success] = '到着・発車時刻を登録しました。'
      redirect_to bus_path(@plan.bus_id)
    else
      flash.now[:danger] = '到着・発車時刻の登録に失敗しました。'
      render_edit
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:bus_id, :stop_id, :arrv_time, :dept_time)
  end

  def render_edit
    @plan.arrv_time = format_time(@plan.arrv_time)
    @plan.dept_time = format_time(@plan.dept_time)
    render :edit
  end
end
