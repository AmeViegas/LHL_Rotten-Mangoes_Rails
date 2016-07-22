class Admin::ApplicationController < ApplicationController

  before_filter :check_admin

  private

  def check_admin
    # render text: "Not allowed", status: 401 
  end

end
