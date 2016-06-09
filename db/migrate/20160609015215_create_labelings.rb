class CreateLabelings < ActiveRecord::Migration[5.0]
  def change
    create_table :labelings do |t|
      t.references :label, foreign_key: true
      t.references :issue, foreign_key: true

      t.timestamps
    end
  end
end
