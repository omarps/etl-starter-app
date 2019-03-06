describe Etl::Organizers::UnitsOrganizer do
  let(:texts_hash) {{
    units_json_dirpath: './data/json/*_units.json',
      unit_groups_csv_filename: './data/csv/units.csv'
  }}
  let(:ctx) do
    ::LightService::Context.make(texts_hash)
  end
  
  it "calls the actions in order" do
    allow(::Etl::Actions::Json::UnitsParserFlattenerAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::UnitAmenitiesAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::UnitsAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Csv::UnitsParserAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)

    allow(::Etl::Actions::Csv::UnitGroupsAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)

    allow(::Etl::Actions::Csv::UnitAmenitiesAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)

    allow(::Etl::Actions::Csv::UnitsAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    result = described_class.call(texts_hash)
    expect(result).to eq(ctx)
  end
end