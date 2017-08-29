class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :email_to_send
      t.string :description
      t.string :href

      t.timestamps
    end
  end
end
