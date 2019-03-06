describe Etl::Actions::Csv::UnitGroupsAction do
  class UnitGroup; end
  class UnitType; end
  
  let(:ctx) do
    data = {:units_csv_hash => units_csv_hash }
    ::LightService::Context.make(data)
  end
  
  let(:ar_object) { double('ActiveRecordObject') }

  context 'succeeds' do
    let(:units_csv_hash) { FactoryBot.create(:units_csv_1_hash) }
    
    before do
      allow(::UnitType).to receive(:find_by).with(any_args).and_return(ar_object)
      allow(ar_object).to receive(:id).and_return(1)
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(true)
    end

    it 'creates a record' do
      @result = described_class.execute(ctx)
      expect(@result).to be_success
    end
  end
  
  context 'next' do
    let(:units_csv_hash) do
      units_csv_hash = FactoryBot.create(:units_csv_2_hash)
      units_csv_hash.first = nil
      units_csv_hash
    end
    
    before do
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(nil)
      @result = described_class.execute(ctx)
    end

    it 'do nothing when nil' do
      expect(ctx.units_csv_hash.first).to be_nil
    end
  end
end
