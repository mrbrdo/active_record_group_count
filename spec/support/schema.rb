ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => File.expand_path('../../test.sqlite3', __FILE__)
)

class CreateSchema < ActiveRecord::Migration
  def change
    create_table "test_models" do |t|
      t.integer    "value"
      t.integer   "group_id"

      t.timestamps null: false
    end
  end
end
