describe Etl::Actions::Json::UnitGroupsAction do
  class UnitGroup; end
  
  let(:ctx) do
    data = {:unit_groups_hash => unit_groups_hash }
    ::LightService::Context.make(data)
  end

  context 'succeeds' do
    let(:unit_groups_hash) { FactoryBot.create(:unit_groups_hash_parent) }
    
    before do
      allow(Etl::Actions::Utils).to receive(:ar_belongs_to_id).with(any_args).and_return(true)
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(true)
      allow(Etl::Actions::Utils).to receive(:ar_has_many_save!).with(any_args).and_return(true)
      @result = described_class.execute(ctx)
    end

    it 'creates a record' do
      expect(@result).to be_success
    end
    
    it 'sets the guids' do
      expect(ctx.unit_groups_hash[0].keys).to include(
        'guid', 'scheduled_move_out_guids', 'channel_rate_guids'
      )
    end
  end
  
  context 'next' do
    let(:unit_groups_hash) do
      unit_groups_hash = FactoryBot.create(:unit_groups_hash_parent)
      unit_groups_hash = []
      unit_groups_hash
    end
    
    before do
      allow(Etl::Actions::Utils).to receive(:ar_create).with(any_args).and_return(nil)
      @result = described_class.execute(ctx)
    end

    it 'do nothing when nil' do
      expect(ctx.unit_groups_hash.first).to be_nil
    end
  end
end
