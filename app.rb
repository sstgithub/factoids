require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///to_do_app.db"

get "life_events/error" do
	erb :"life_events/error"
end

get "/life_events" do 
	@life_events = LifeEvent.all
	erb :"life_events/index"
end

#to delete

get "/life_events/:id" do
	@life_event = LifeEvent.find(params[:id])
	erb :"life_events/show"
end

delete "/life_events/:id" do 
	@life_event = LifeEvent.find(params[:id])
	if @life_event.delete
		redirect "/life_events"
	else
		redirect "/life_events/error"
	end
end


#to edit

get "/life_events/:id/edit" do
	@life_event = LifeEvent.find(params[:id])
	erb :"life_events/edit"
end

put "/life_events/:id" do
	@life_event = LifeEvent.find(params[:id])
	@life_event.update_attributes(params[:life_event])
	redirect "/life_events"
end


#to add

get "/life_events/:id/new" do
	@life_event = LifeEvent.new
	@new_life_event = LifeEvent.new
	erb :"life_events/new"
end

post "/life_events" do
	@life_event = LifeEvent.new(params[:life_event])
	@life_event.save
	redirect "/life_events"
end

class School < ActiveRecord::Base
end


class LifeEvent < ActiveRecord::Base
	def check_if_valid
	end
end
