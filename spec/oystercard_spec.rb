require 'oystercard'
describe Oystercard do
  it 'has balance equal 0' do
    expect(subject.balance).to eq(0)
  end
end