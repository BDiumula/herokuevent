class EventsController < ApplicationController
	def index
		@event = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.create!(start_date:params[:start_date], duration: params[:duration], period: :morning) ,title: params[:title] , description:params[:description], price: params[:price],location: params[:location], user_id: current_user_id)
		@event.user = User.find_by(id: session[:user_id])
		flash[:notice]= "Bravo, vous avez créer un nouvel évènement!"
		redirect_to events_path
	end 

	def show
		@event = Event.find(params[:id])
		 
	end
end

