class CreateExternalApplications < ActiveRecord::Migration
  def change
    create_table :external_applications do |t|
      t.string :name

      t.timestamps
    end
  end
end
