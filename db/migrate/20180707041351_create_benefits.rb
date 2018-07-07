class CreateBenefits < ActiveRecord::Migration[5.2]
  def change
    create_table :benefits do |t|
      t.string :name
      t.string :description
      t.string :link
      t.integer :flat_cost
      t.integer :percent_cost

      t.timestamps
    end
  end
end
