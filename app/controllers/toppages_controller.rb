class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
#    @task = current_user.tasks.build
    @tasks = current_user.tasks.order('created_at DESC')
  end
end
