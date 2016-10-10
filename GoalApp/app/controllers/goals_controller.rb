class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      render :show
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find_by_id(params[:id])
    if @goal.user_id != current_user.id
      render :show
    end
    render :edit
  end

  def update
    @goal = Goal.find_by_id(params[:id])
    if @goal.update_attributes(goal_params)
      render :show
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find_by_id(params[:id])
    if @goal.user_id != current_user.id
      render :show
    end

    @goal.destroy
    redirect_to user_url(current_user)
  end

  def show
    @goal = Goal.find_by_id(params[:id])
  end

  def complete
    @goal = Goal.find_by_id(params[:id])
    @goal.finished = (@goal.finished == "true" ? "false" : "true")
    @goal.save
    render :show
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :details, :finished, :visibility)
  end
end
