describe Etl::Actions::Json::UnitGroupsParserAction do
  let!(:json_data_dir) { File.join(File.expand_path('spec'), 'support', 'data', 'json') }
  let!(:unit_groups_filename) { File.join(json_data_dir, 'unit_groups.json') }
  let!(:unit_groups_filename_no_data) { File.join(json_data_dir, 'unit_groups_no_data.json') }

  context 'when the file is readable' do
    context 'with data' do
      let(:ctx) do
        data = {:unit_groups_filename => unit_groups_filename }
        ::LightService::Context.make(data)
      end
      
      before do
        described_class.execute(ctx)
      end
  
      it 'succeeds' do
        expect(ctx).to be_truthy
      end
      
      it 'contains data' do
        expect(ctx.unit_groups_hash).not_to be_empty
        expect(ctx.unit_groups_hash.first['id']).not_to be_nil
      end
    end
    
    context 'without data' do
      let(:ctx) do
        data = {:unit_groups_filename => unit_groups_filename_no_data }
        ::LightService::Context.make(data)
      end
      
      before do
        described_class.execute(ctx)
      end

      it 'doesn\'t contains data' do
        expect(ctx.unit_groups_hash).to be_empty
      end
    end
  end

  context 'when the file is not readable' do
    let(:ctx) do
      data = {:unit_groups_filename => unit_groups_filename }
      ::LightService::Context.make(data)
    end

    before do
      allow(File).to receive(:readable?).with(any_args).and_return(false)
      described_class.execute(ctx)
    end

    it 'fails' do
      expect(ctx[:success]).to be_falsey
    end

    it 'returns a failure message.' do
      expect(ctx.message).to eq "File is not readable: #{ctx.unit_groups_filename}"
    end
  end
end