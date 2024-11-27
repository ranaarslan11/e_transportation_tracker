class ETransportation < ApplicationRecord
  enum transportation_type: { e_scooter: 0, e_bike: 1 }, _prefix: true
  enum sensor_type: { small: 0, medium: 1, big: 2 }, _prefix: true

  validates :transportation_type, presence: true
  validates :sensor_type, presence: true
  validates :owner_id, presence: true
  validates :in_zone, inclusion: { in: [true, false] }
  validates :lost_sensor, inclusion: { in: [true, false] }, if: -> { transportation_type == 'e_scooter' }

end
