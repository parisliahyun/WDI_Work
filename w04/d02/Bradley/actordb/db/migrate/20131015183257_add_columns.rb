class AddColumns < ActiveRecord::Migration
  def up
    add_column :actors, :birth_date, :date
  end
end
