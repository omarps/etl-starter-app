describe Etl::Actions::Json::UnitTypeAction do
  class UnitType; end
  
  let(:ctx) do
    data = {:unit_groups_hash => unit_groups_hash }
    ::LightService::Context.make(data)
  end

  context 'succeeds' do
    let(:unit_groups_hash) { FactoryBot.create(:unit_groups_hash) }
    
    before do
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(true)
      @result = described_class.execute(ctx)
    end

    it 'creates a record' do
      expect(@result).to be_success
    end
    
    it 'sets the guids' do
      expect(ctx.unit_groups_hash.first['unit_type'].keys).to include('guid')
    end
  end
  
  context 'next' do
    let(:unit_groups_hash) do
      unit_groups_hash = FactoryBot.create(:unit_groups_hash)
      unit_groups_hash.first['unit_type'] = nil
      unit_groups_hash
    end
    
    before do
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(nil)
      @result = described_class.execute(ctx)
    end

    it 'do nothing when nil' do
      expect(ctx.unit_groups_hash.first['unit_type']).to be_nil
    end
  end
end
