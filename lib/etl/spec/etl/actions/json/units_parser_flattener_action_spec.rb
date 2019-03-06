describe Etl::Actions::Json::UnitsParserFlattenerAction do
  let!(:json_data_dir) { File.join(File.expand_path('spec'), 'support', 'data', 'json') }
  let!(:units_filename) { File.join(json_data_dir, '1_units.json') }
  let!(:units_filename_multiple) { File.join(json_data_dir, '*_units.json') }
  let!(:units_filename_no_data) { File.join(json_data_dir, '*__no_data.json') }

  context 'when the files are readable' do
    context 'with data' do
      let(:ctx) do
        data = {:units_json_dirpath => units_filename }
        ::LightService::Context.make(data)
      end
      
      before do
        described_class.execute(ctx)
      end

      it 'succeeds' do
        expect(ctx).to be_truthy
      end

      it 'contains data' do
        expect(ctx.units_json_hash).not_to be_empty
        expect(ctx.units_json_hash.size).to eq 1
        expect(ctx.units_json_hash.first['id']).not_to be_nil
      end
    end
    
    context 'with multiple files' do
      let(:ctx) do
        data = {:units_json_dirpath => units_filename_multiple }
        ::LightService::Context.make(data)
      end
      
      before do
        described_class.execute(ctx)
      end

      it 'succeeds' do
        expect(ctx).to be_truthy
      end

      it 'contains data' do
        expect(ctx.units_json_hash).not_to be_empty
        expect(ctx.units_json_hash.size).to eq 2
        expect(ctx.units_json_hash[0]['id']).not_to be_nil
        expect(ctx.units_json_hash[1]['id']).not_to be_nil
      end
    end

    context 'without data' do
      let(:ctx) do
        data = {:units_json_dirpath => units_filename_no_data }
        ::LightService::Context.make(data)
      end
      
      before do
        described_class.execute(ctx)
      end
      
      it 'doesn\'t contains data' do
        expect(ctx.units_json_hash).to be_empty
      end
    end
  end

  context 'when the files are not readable' do
    let(:ctx) do
      data = {:units_json_dirpath => units_filename }
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
      expect(ctx.message).to eq "Any of the dir files are not readable: #{ctx.units_json_dirpath}"
    end
  end
end