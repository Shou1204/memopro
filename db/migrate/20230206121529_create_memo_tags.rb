class CreateMemoTags < ActiveRecord::Migration[6.0]
  def change
    create_table :memo_tags do |t|

      t.timestamps
    end
  end
end
