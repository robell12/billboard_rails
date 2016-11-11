class CreateBillboards < ActiveRecord::Migration[5.0]
  def change
    create_table :billboards do |t|
      t.string :name
      t.integer :total

      t.timestamps
    end
  end
end
