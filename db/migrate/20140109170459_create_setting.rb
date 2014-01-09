class CreateSetting < ActiveRecord::Migration
  def change
    create_table :setting do |t|
      t.string :oauth_id
      t.string :oauth_secret
      t.string :name

      t.timestamps
    end
  end
end
