class PersonsController < ApplicationController
  def profile
    @name = current_user.first_name
    @email = current_user.email
  end
end
