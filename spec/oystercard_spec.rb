require 'oystercard'
describe Oystercard do

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

 describe "#deduct" do
  it { is_expected.to respond_to(:deduct).with(1).argument }

  it 'charge 1 for a trip' do
    expect{subject.deduct 1}.to change{subject.balance}.by -1
  end
 end

end