class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :password_digest
      t.references :teacher, index: true, foreign_key: true
      t.timestamps
    end
  end
end
