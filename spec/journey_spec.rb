require 'journey'

describe Journey do
  let(:station) {double :station, zone: 1}

  it 'knows it journey is complete' do
    expect(subject).not_to be_complete
  end

  it 'has a pentalty fare' do
    pentalty = Journey::PENALTY_FARE
    expect(subject.fare).to eq pentalty
  end

  it 'returns itself when journey is finished' do
    expect(subject.finish(station)).to eq subject
  end
    # context 'entry station is give' do
    #   subject {described_class.new(entry_station: station)}
    #   it 'has an entry station' do
    #     expect(subject).to eq station
    #   end
    # end

  end
