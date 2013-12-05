class AddFaperToVerification < ActiveRecord::Migration
  def change
    add_column :verifications, :faper, :integer
  end
end
