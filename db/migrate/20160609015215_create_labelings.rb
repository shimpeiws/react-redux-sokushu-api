class CreateLabelings < ActiveRecord::Migration[5.0]
  def change
    create_table :labelings do |t|
      t.references :label_id, foreign_key: true
      t.references :issue_id, foreign_key: true

      t.timestamps
    end
  end
end
