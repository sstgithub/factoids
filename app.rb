require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///to_do_app.db"

get "/error" do
	erb :"/error"
end

get "/life_events" do 
	@life_events = LifeEvent.all
	erb :"life_events/index"
end

get "/schools" do 
	@schools = School.all
	erb :"schools/index"
end

post "/life_events/results" do
	@life_events = LifeEvent.search(params[:query])
	erb :"life_events/results"
end

post "/schools/results" do
	@schools = School.search(params[:query])
	erb :"schools/results"
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
		redirect "/error"
	end
end

get "/schools/:id" do
	@school = School.find(params[:id])
	erb :"schools/show"
end

delete "/schools/:id" do 
	@school = School.find(params[:id])
	if @school.delete
		redirect "/schools"
	else
		redirect "/error"
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

get "/schools/:id/edit" do
	@school = School.find(params[:id])
	erb :"schools/edit"
end

put "/schools/:id" do
	@school = School.find(params[:id])
	@school.update_attributes(params[:school])
	redirect "/schools"
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

get "/schools/:id/new" do
	@school = School.new
	@new_school = School.new
	erb :"schools/new"
end

post "/schools" do
	@school = School.new(params[:school])
	@school.save
	redirect "/schools"
end

# #to search

# get '/life_events/search' do
# 	@life_events = LifeEvent.all
#   # @life_events = LifeEvent.find(:description => "%#{params[:query]}%")
#   if params[:search]
#     @life_events = LifeEvent.search(params[:search]).order("created_at DESC")
#   else
#     @life_events = LifeEvent.all.order('created_at DESC')
#   end
#   erb :"life_events/search"
# end

class School < ActiveRecord::Base

	def index
	end

	def self.search(query)
  	where("name like ?", "%#{query}%") 
	end
end


class LifeEvent < ActiveRecord::Base

	def index
	end

	def self.search(query)
  	where("description like ?", "%#{query}%") 
	end
end
