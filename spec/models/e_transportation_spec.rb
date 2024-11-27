require 'rails_helper'

RSpec.describe ETransportation, type: :model do
  let(:valid_attributes) do
    {
      transportation_type: :e_bike,
      sensor_type: :small,
      owner_id: 123,
      in_zone: false
    }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      transport = ETransportation.new(valid_attributes)
      expect(transport).to be_valid
    end

    it "is invalid without transportation_type" do
      transport = ETransportation.new(valid_attributes.except(:transportation_type))
      expect(transport).not_to be_valid
      expect(transport.errors[:transportation_type]).to include("can't be blank")
    end

    it "is invalid without sensor_type" do
      transport = ETransportation.new(valid_attributes.except(:sensor_type))
      expect(transport).not_to be_valid
      expect(transport.errors[:sensor_type]).to include("can't be blank")
    end

    it "is invalid without owner_id" do
      transport = ETransportation.new(valid_attributes.except(:owner_id))
      expect(transport).not_to be_valid
      expect(transport.errors[:owner_id]).to include("can't be blank")
    end

    it "validates inclusion of in_zone in [true, false]" do
      transport = ETransportation.new(valid_attributes.merge(in_zone: nil))
      expect(transport).not_to be_valid
      expect(transport.errors[:in_zone]).to include("is not included in the list")
    end

    context "when transportation_type is e_scooter" do
      it "requires lost_sensor to be true or false" do
        transport = ETransportation.new(valid_attributes.merge(transportation_type: :e_scooter, lost_sensor: nil))
        expect(transport).not_to be_valid
        expect(transport.errors[:lost_sensor]).to include("is not included in the list")
      end
    end
  end

  describe "enums" do
    it "defines transportation_type enum" do
      expect(ETransportation.transportation_types).to eq({ "e_scooter" => 0, "e_bike" => 1 })
    end

    it "defines sensor_type enum" do
      expect(ETransportation.sensor_types).to eq({ "small" => 0, "medium" => 1, "big" => 2 })
    end
  end
end
