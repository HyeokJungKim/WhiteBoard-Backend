class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.references :teacher, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.timestamps
    end
  end
end
