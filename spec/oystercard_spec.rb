require 'oystercard'
describe Oystercard do
subject(:oystercard) { described_class.new }
let(:station) {double :station}
let(:entry_station) {double :station}
let(:exit_station) {double :station}
let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

 it 'have initial balance' do
  expect(subject.balance).to eq(0)
 end

 describe '#top_up' do

  it {is_expected.to respond_to(:top_up).with(1).argument}

  it 'can be top up with certain amount' do
    expect{subject.top_up(10)}.to change{subject.balance}.by 10
  end

  it 'throws an error if balance is over 90' do
    max_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(max_balance)
    expect{subject.top_up 1}.to raise_error "Maximum balance of #{max_balance } exceeded"
  end
 end

  context 'journey'  do
    describe "#in_journey?" do
      it 'is not in journey initially' do
        expect(subject).not_to be_in_journey
     end

     it 'stores entry station' do
      subject.balance = 10
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
     end
    end

    describe 'touch in' do
      it 'can be touch in ' do
        subject.balance = 10
        subject.touch_in(station)
        expect(subject).to be_in_journey
      end
    end

    describe 'error when not enough balance' do
      it 'will not touch out if there is not enough money' do
        subject.balance = 0
        expect{ subject.touch_in(station) }.to raise_error "You do not have enough money!"
      end
  end

    describe 'touch out' do
      it 'can be touch in ' do
        subject.touch_out(exit_station)
        expect(subject).not_to be_in_journey
      end
      it 'stores exit station' do
        subject.balance = 10
        subject.touch_out(exit_station)
        expect(subject.exit_station).to eq exit_station
      end
   end

  end

  context 'completed journey' do
    describe 'store journey' do
      it 'has an empty list of journeys by default' do
        expect(subject.journeys).to be_empty
      end

      it 'stores a journey in  a hash' do
        subject.top_up 10
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.journeys).to include journey
      end

     end
   end
end