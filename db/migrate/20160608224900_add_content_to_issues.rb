class AddContentToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :content, :text
  end
end
