class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string  :resource
      t.string  :short_resource
      t.integer :visit_count
      t.timestamps
    end
  end
end
