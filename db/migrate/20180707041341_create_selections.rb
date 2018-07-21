class CreateSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :selections do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :benefit, foreign_key: true
      t.integer :beneficiaries

      t.timestamps
    end
  end
end
