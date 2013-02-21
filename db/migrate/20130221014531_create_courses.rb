class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :department
      t.string :number
      t.integer :user_id

      t.timestamps
    end
  end
end
