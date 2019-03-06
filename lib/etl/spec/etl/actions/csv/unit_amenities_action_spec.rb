describe Etl::Actions::Csv::UnitAmenitiesAction do
  class UnitAmenity; end
  
  let(:ctx) do
    data = {:units_csv_hash => units_csv_hash }
    ::LightService::Context.make(data)
  end

  context 'succeeds' do
    let(:units_csv_hash) { FactoryBot.create(:units_csv_1_hash) }
    
    before do
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(true)
    end

    it 'creates a record' do
      @result = described_class.execute(ctx)
      expect(@result).to be_success
    end
    
    it 'sets the guids' do
      # @result = described_class.execute(ctx)
      
    end
  end
  
  context 'next' do
    let(:units_csv_hash) do
      units_csv_hash = FactoryBot.create(:units_csv_2_hash)
      units_csv_hash.first['channel_rate'] = nil
      units_csv_hash
    end
    
    before do
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(nil)
      @result = described_class.execute(ctx)
    end

    it 'do nothing when nil' do
      expect(ctx.units_csv_hash.first['channel_rate']).to be_nil
    end
  end
end
