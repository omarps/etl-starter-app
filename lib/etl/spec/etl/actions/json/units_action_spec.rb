describe Etl::Actions::Json::UnitsAction do
  class Unit; end
  class UnitGroup; end
  
  let(:ctx) do
    data = {:units_json_hash => units_json_hash }
    ::LightService::Context.make(data)
  end

  context 'succeeds' do
    let(:units_json_hash) { FactoryBot.create(:units_json_hash) }
    
    before do
      allow(::UnitGroup).to receive(:exists?).with(any_args).and_return(false)
      allow(Etl::Actions::Utils).to receive(:ar_belongs_to_id).with(any_args).and_return(true)
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(true)
      allow(Etl::Actions::Utils).to receive(:ar_has_many_save!).with(any_args).and_return(true)
      @result = described_class.execute(ctx)
    end

    it 'creates a record' do
      expect(@result).to be_success
    end
    
    it 'sets the guids' do
      expect(ctx.units_json_hash[0].keys).to include(
        'guid', 'current_ledger_guid', 'current_tenant_guid'
      )
    end
  end
  
  context 'next' do
    let(:units_json_hash) do
      units_json_hash = FactoryBot.create(:units_json_hash)
      units_json_hash = []
      units_json_hash
    end
    
    before do
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(nil)
      @result = described_class.execute(ctx)
    end

    it 'do nothing when nil' do
      expect(ctx.units_json_hash.first).to be_nil
    end
  end
end
