class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.bigint :payment, null: false, default: 0
      t.timestamps
    end
  end
end
