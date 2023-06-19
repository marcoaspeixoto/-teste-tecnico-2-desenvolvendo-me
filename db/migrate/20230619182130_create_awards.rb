class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|
      t.references :event, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
