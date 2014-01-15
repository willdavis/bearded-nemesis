class HomeController < ApplicationController
  def index
  end

	def health_check
  	render :nothing => true, :status => 200
  end
end
