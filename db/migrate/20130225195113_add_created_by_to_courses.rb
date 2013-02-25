class AddCreatedByToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :created_by, :integer
  end
end
