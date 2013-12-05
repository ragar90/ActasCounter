class AddFaperToActum < ActiveRecord::Migration
  def change
    add_column :acta, :faper, :integer
  end
end
