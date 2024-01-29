class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:books)
      create_table :books do |t|
        t.string :title

        t.timestamps
      end
    end
  end
end
