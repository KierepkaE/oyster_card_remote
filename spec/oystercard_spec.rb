require 'oystercard'
describe Oystercard do

 it 'have initial balance' do
  expect(subject.balance).to eq(0)
 end

 describe '#top_up' do

  it {is_expected.to respond_to(:top_up).with(1).argument}

  it 'can be top up with certain amount' do
    expect{subjec.top_up 10}.to change{subject.balance}.by 10
  end
 end

end