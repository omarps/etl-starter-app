require 'csv'

module Etl
  module Actions
    module Csv
      class UnitsParserAction
        extend ::LightService::Action
        expects :units_csv_text
        promises :units_csv_hash
        
        executed do |ctx|
          units_csv_text = ctx.units_csv_text
          units_csv = CSV.parse(units_csv_text, :headers => true)
          ctx.units_csv_hash = units_csv.map(&:to_h)
        end
      end
    end
  end
end
