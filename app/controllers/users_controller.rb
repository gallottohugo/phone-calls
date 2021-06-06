class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bill_month = params[:month].to_i
    @bill = @user.calls_bill(@bill_month)
  end

  
end