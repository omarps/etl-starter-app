describe Etl::Organizers::UnitGroupsOrganizer do
  let(:unit_groups_filename) { double('unit_groups_filename') }
  let(:ctx) do
    ::LightService::Context.make(
      :unit_groups_filename => unit_groups_filename
    )
  end
  
  
  it "calls the actions in order" do
    allow(::Etl::Actions::Json::UnitGroupsParserAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::InvoiceableFeesAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::ChannelRateAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::UnitTypeAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::DiscountsAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::ControlsAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::ClientApplicationsAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::DiscountPlansAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    allow(::Etl::Actions::Json::UnitGroupsAction).to receive(:execute)
      .with(ctx)
      .and_return(ctx)
    
    result = described_class.call(unit_groups_filename)
    expect(result).to eq(ctx)
  end
end
