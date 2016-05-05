class CreateProactiveSupportFlags < ActiveRecord::Migration
  def change
    create_table :proactive_support_flags, options: 'CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci' do |t|
      t.integer :customer_id, null: false

      t.string :source, null: false
      t.string :identifier, null: false
      t.string :message, null: false
      t.string :filter

      t.string :debug_params
      t.integer :level, default: 0
      t.string :tags
      t.datetime :last_triggered_date
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
