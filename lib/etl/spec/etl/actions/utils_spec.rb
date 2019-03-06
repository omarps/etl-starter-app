describe Etl::Actions::Utils do
  let(:ar_class) { double('ActiveRecordClass') }
  let(:ar_object) { double('ActiveRecordObject') }
  let(:guid) { '1111-2222-3333-4444' }
  let(:attributes) {{ guid: guid }}

  context 'self.ar_create' do
    let(:ctx) { ::LightService::Context.make({}) }

    it 'succeeds' do
      allow(ar_class).to receive(:exists?).and_return(false)
      allow(ar_class).to receive(:create).with(attributes).and_return(ar_object)
      allow(ar_object).to receive(:persisted?).and_return(true)
      result = described_class.ar_create(ctx, ar_class, attributes)
      expect(result).to be_nil
    end
    
    it 'exists' do
      allow(ar_class).to receive(:exists?).and_return(true)
      result = described_class.ar_create(ctx, ar_class, attributes)
      expect(result).to be_falsey
    end

    context 'fails' do
      before do
        allow(ar_class).to receive(:exists?).and_return(false)
        allow(ar_class).to receive(:create).with(attributes).and_return(ar_object)
        allow(ar_object).to receive(:persisted?).and_return(false)
        described_class.ar_create(ctx, ar_class, attributes)
      end

      it 'fails' do
        expect(ctx[:success]).to be_falsey
      end

      it 'returns a failure message' do
        expect(ctx.message).to eq "#{ar_class} was not persisted. attributes: #{attributes}."
      end
    end
  end
  
  context 'self.ar_belongs_to_id' do
    let(:ar_object_id) { 1 }

    it 'succeeds' do
      allow(ar_class).to receive(:find_by).with(guid: attributes['guid']).and_return(ar_object)
      allow(ar_object).to receive(:id).and_return(ar_object_id)
      expect(described_class.ar_belongs_to_id(ar_class, attributes)).to eq(ar_object_id)
    end

    it 'returns nil' do
      allow(ar_class).to receive(:find_by).with(guid: attributes['guid']).and_return(nil)
      expect(described_class.ar_belongs_to_id(ar_class, attributes)).to be_nil
    end
  end
  
  context 'self.ar_has_many_save' do
    let(:ar_many_class) { double('ActiveRecordManyClass') }
    let(:ar_many_object) { double('ActiveRecordManyObject') }
    let(:many_array) {[
      { 'guid': 1 },
      { 'guid': 2 }
    ]}

    it 'succeeds' do
      allow(ar_class).to receive(:exists?).with(any_args).and_return(true)
      allow(ar_class).to receive(:find_by).with(any_args).and_return(ar_object)
      allow(ar_many_class).to receive(:find_by).with(any_args).and_return(ar_many_object)
      allow(ar_object).to receive(:update_attribute).with(any_args).and_return(true)
      expect(
        described_class.ar_has_many_save!(ar_class, guid, ar_many_class, 'many_field', many_array)
      ).to be_truthy
    end

    it 'is an empty collection' do
      allow(ar_class).to receive(:exists?).with(any_args).and_return(false)
      expect(
        described_class.ar_has_many_save!(ar_class, guid, ar_many_class, 'many_field', [])
      ).to be_nil
    end
  end
end