class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    # ここでは、user_idとcreated_atの2つのカラムにインデックスを追加している。
    add_index :microposts, [:user_id, :created_at]
  end
end
