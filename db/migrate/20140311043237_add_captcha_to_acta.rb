class AddCaptchaToActa < ActiveRecord::Migration
  def change
    add_column :acta, :captcha, :string
    add_column :acta, :contendiente, :boolean
    add_column :acta, :verified, :boolean, default: false
    add_column :verifications, :counter, :integer, default: 0
    add_column :verifications, :verification_number, :integer, default: 0
  end
end
