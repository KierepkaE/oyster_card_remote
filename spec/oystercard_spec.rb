require 'oystercard'
describe Oystercard do
 it 'have initial balance' do
  expect(subject.balance).to eq(0)
 end


end