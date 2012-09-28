# coding: utf-8

class UsersController < ApplicationController
  
  def show
  end

  def create
    user = User.new(params[:user])
    if user.save
      self.current_user = user
      user.update_attribute(:last_signed_in_at, Time.now)
      redirect_to :root
    else
      flash[:error] = user.errors.full_messages
      redirect_to :back
    end
  end

end