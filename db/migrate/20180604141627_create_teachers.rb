class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :password_digest
      t.references :school, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
