class ChangeFormatOfSummaryColumn < ActiveRecord::Migration
  def change
    change_column :users, :summary, :text
    change_column :users, :headline, :text
  end
end
