class PlansController < ApplicationController
  before_action :require_user_logged_in

  def edit
    @plan = Plan.find(params[:id])
    @plan.arrv_time = format_time(@plan.arrv_time)
    @plan.dept_time = format_time(@plan.dept_time)
  end

  def update
    @plan = Plan.find(params[:id])
    p_arrv_time = params[:plan][:arrv_time]
    p_dept_time = params[:plan][:dept_time]

    if !(f_HHMM?(p_arrv_time) && f_HHMM?(p_dept_time))
      flash.now[:danger] = '正しい時刻を入力してください。'
      render_edit
    elsif p_arrv_time.to_time > p_dept_time.to_time
      flash.now[:danger] = '到着時刻は発車時刻より前にしてください。'
      render_edit
    elsif @plan.update(plan_params)
      flash.now[:success] = '到着・発車時刻を登録しました。'
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
#    redirect_to request.referer
  end
end
