require 'carrierwave/test/matchers'

RSpec.describe ImageUploader do
  include CarrierWave::Test::Matchers
  let(:book) { build(:book, :with_image) }
  let(:path_to_file) { 'spec/fixtures/1.jpg' }
  let(:uploader) { described_class.new(book, :book_images) }

  before do
    described_class.enable_processing = true
    File.open(path_to_file) { |f| uploader.store!(f) }
  end

  after do
    described_class.enable_processing = false
    uploader.remove!
  end

  context 'when small version' do
    it 'scales down a landscape image to be exactly 100 by 100 pixels' do
      expect(uploader.small_img).to have_dimensions(150, 200)
    end
  end

  context 'when medium version' do
    it 'scales down a landscape image to be exactly 200 by 200 pixels' do
      expect(uploader.medium_img).to have_dimensions(225, 300)
    end
  end

  context 'when big version' do
    it 'scales down a landscape image to be exactly 64 by 64 pixels' do
      expect(uploader.big_img).to have_dimensions(550, 733)
    end
  end

  context 'when the image format is invalid' do
    it 'raises an error' do
      file = File.open(Rails.root.join('spec', 'fixtures', 'text.txt'))
      expect { uploader.store!(file) }.to raise_error(CarrierWave::IntegrityError)
      file.close
    end
  end

  it 'call default url' do
    expect(uploader.default_url).not_to be(nil)
  end

  it 'has the correct format' do
    expect(uploader).to be_format('JPEG')
  end
end
