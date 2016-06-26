class WelcomeController < ApplicationController
  def index
    @attendances = current_user.attends.current_date_attendances
  end
end
