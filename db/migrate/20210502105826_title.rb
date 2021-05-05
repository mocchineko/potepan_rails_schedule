class Title < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string
    add_column :posts, :start, :date
    add_column :posts, :last, :date
    add_column :posts, :all_day, :boolean
  end
end
