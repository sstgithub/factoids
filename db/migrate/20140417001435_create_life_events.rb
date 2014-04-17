class CreateLifeEvents < ActiveRecord::Migration
  def change
  	create_table 	:life_events do |e|
  		e.string 		:description
  		e.date 			:date
  		e.timestamps # => created_at updated_at
		end
  end
end
