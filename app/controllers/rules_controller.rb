class RulesController < ApplicationController
  def index
    if params[:user_id]
      @users = User.where(id: params[:user_id]).includes(:rules)
    else
      @users = User.all.includes(:rules)
    end
  end

  def new
    @rule = rule_user.rules.build
  end

  def create
    @rule = rule_user.rules.create!(rule_params)
    redirect_to edit_user_rule_path(params[:user_id], @rule)
  end

  def edit
    @rule = rule_user.rules.find(params[:id])
  end

  def update
    @rule = rule_user.rules.find(params[:id])
    @rule.update!(rule_params)
    redirect_to edit_user_rule_path(params[:user_id], @rule)
  end

  def destroy
    @rule = rule_user.rules.find(params[:id])
    @rule.destroy!
    redirect_to user_rules_path(params[:user_id])
  end

  private

  def rule_user
    @rule_user ||= User.find(params[:user_id])
  end

  def rule_params
    params.require(:rule).permit(:name, :query, :channel)
  end
end