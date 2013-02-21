class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :notes
      t.date :due
      t.integer :course_id

      t.timestamps
    end
  end
end
