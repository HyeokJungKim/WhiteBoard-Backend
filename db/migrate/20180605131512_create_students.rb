class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :password_digest
      t.boolean :isAccount, default: false


      t.timestamps
    end
  end
end
