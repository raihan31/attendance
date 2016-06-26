class WelcomeController < ApplicationController
  def index
    @current_employee = current_user
    @attendances = current_user.attends
  end
end
