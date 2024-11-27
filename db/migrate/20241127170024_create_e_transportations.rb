class CreateETransportations < ActiveRecord::Migration[7.1]
  def change
    create_table :e_transportations, options: 'ENGINE=MEMORY' do |t|
      t.integer :transportation_type, null: false
      t.integer :sensor_type, null: false
      t.integer :owner_id, null: false
      t.boolean :in_zone, null: false, default: true
      t.boolean :lost_sensor, null: true
      t.timestamps
    end
  end
end
