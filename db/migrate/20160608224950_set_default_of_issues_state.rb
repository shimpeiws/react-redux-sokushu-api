class SetDefaultOfIssuesState < ActiveRecord::Migration[5.0]
  def change
    change_column_default :issues, :status, 1
    change_column_null :issues, :status, false
  end
end
