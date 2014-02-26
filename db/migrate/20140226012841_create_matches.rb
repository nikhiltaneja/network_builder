class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :requester_id
      t.integer :responder_id
      t.string :requester_status
      t.string :responder_status, default: :pending
      t.string :status, default: :pending

      t.timestamps
    end
  end
end
