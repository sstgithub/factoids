class CreateSchools < ActiveRecord::Migration
  def change
  	create_table 	:schools do |s|
  		s.string 		:name
  		s.timestamps # => created_at updated_at
  	end
  end
end
