class ChangeLifeEventsTable < ActiveRecord::Migration
  def change
  	change_column :life_events, :date, :date, default: "April 17, 2014" # has to be table, column, type
  end
end
