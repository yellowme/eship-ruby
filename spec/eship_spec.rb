RSpec.describe Eship do
  it 'configures eship gem' do
    # Given
    base_uri = 'http://google.com'
    eship_key = 'random_key1'

    # When
    Eship.config do |c|
      c.base_uri = base_uri
      c.eship_key = eship_key
    end

    # Then
    expect(Eship.base_uri).to eq base_uri
    expect(Eship.eship_key).to eq eship_key
  end

  it "has a version number" do
    expect(Eship::VERSION).not_to be nil
  end

end
