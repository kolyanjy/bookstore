require 'carrierwave/test/matchers'

RSpec.describe ImageUploader, type: :model do
  include CarrierWave::Test::Matchers
  let(:book) { build(:book) }
  let(:path_to_file) { 'spec/fixtures/1.jpg' }
  let(:uploader) { ImageUploader.new(book, :image) }

  before do
    ImageUploader.enable_processing = true
    File.open(path_to_file) { |f| uploader.store!(f) }
  end

  after do
    ImageUploader.enable_processing = false
    uploader.remove!
  end


  context 'the small version' do
    it 'scales down a landscape image to be exactly 100 by 100 pixels' do
      expect(uploader.small_img).to have_dimensions(150, 200)
    end
  end

  context 'the medium version' do
    it 'scales down a landscape image to be exactly 200 by 200 pixels' do
      expect(uploader.medium_img).to have_dimensions(225, 300)
    end
  end
  context 'the big version' do
    it 'scales down a landscape image to be exactly 64 by 64 pixels' do
      expect(uploader.big_img).to have_dimensions(550, 733)
    end
  end

  context 'when the image format is invalid' do
    it 'raises an error' do
      file = File.open(File.join(Rails.root, '/spec/fixtures/text.txt'), 'rb')
      expect { uploader.store!(file) }.to raise_error(CarrierWave::IntegrityError)
      file.close
    end
  end
  it "has the correct format" do
    expect(uploader).to be_format('JPEG')
  end
end
