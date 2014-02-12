require 'spec_helper'

describe Appointment do
  let(:appointment) do
    Appointment.new(user_id: 1, room_id: 2, start:Time.now, finish: 3.hours.from_now)
  end

  it "is valid if it has all the attributes" do
    expect(appointment).to be_valid
  end

  it "is invalid without a user_id" do
    appointment.user_id = nil
    expect(appointment).to have(1).errors_on(:user_id)
  end

  it "is invalid without a room_id" do
    appointment.room_id = nil
    expect(appointment).to have(1).errors_on(:room_id)
  end

  it "is invalid without a start time" do
    appointment.start = nil
    expect(appointment).to have(2).errors_on(:start)
  end

  it "is invalid without a finish time" do
    appointment.finish = nil
    expect(appointment).to have(1).errors_on(:finish)
  end

  describe "start/finish" do
    context "start before finish" do
      it "is valid" do
        expect(appointment).to have(0).errors_on(:start)
      end
    end

    context "start after finish" do
      it "is not valid" do
        appointment.start = 1.year.from_now
        expect(appointment).to have(1).errors_on(:start)
      end
    end


  end

  
  describe "overlap" do
    context "the start time for the appointment is before the finish time of another previous appointment" do
      it "is not valid" do
        appointment2 = Appointment.new(user_id: 1, room_id: 2, start: 1.hours.ago, finish:7.hours.from_now)
        expect(appointment2).to have(1).errors_on(:start)
      end
    end
    
    context "start time is after finish time" do
      it "is valid" do
        appointment2 = Appointment.new(user_id: 1, room_id: 2, start:4.hours.from_now, finish:7.hours.from_now )
        expect(appointment2).to have(0).errors_on(:start)
      end
    end

  end


  


end