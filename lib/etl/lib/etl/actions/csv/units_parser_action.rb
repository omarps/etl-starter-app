require 'csv'

module Etl
  module Actions
    module Csv
      class UnitsParserAction
        extend ::LightService::Action
        expects :unit_groups_csv_filename
        promises :units_csv_hash
        
        executed do |ctx|
          units_csv_text = File.read(ctx.unit_groups_csv_filename)
          units_csv = CSV.parse(units_csv_text, :headers => true)
          ctx.units_csv_hash = units_csv.map(&:to_h)
        end
      end
    end
  end
end
