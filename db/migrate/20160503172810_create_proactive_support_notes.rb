class CreateProactiveSupportNotes < ActiveRecord::Migration
  def change
    create_table :proactive_support_notes, options: 'CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci' do |t|
      t.integer :customer_id, null: false
      t.integer :user_id, limit: 8, index: true, foreign_key: { references: [:users, :id], on_delete: :set_null}
      t.string :title, null: false
      t.string :content, limit: 16777215
      t.integer :level, default: 0
      t.string :tags
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
