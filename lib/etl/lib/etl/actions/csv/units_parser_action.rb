require 'csv'

module Etl
  module Actions
    module Csv
      class UnitsParserAction
        extend ::LightService::Action
        expects :units_csv_filename
        promises :units_csv_hash
        
        executed do |ctx|
          unless File.readable?(ctx.units_csv_filename)
            ctx.fail!("File is not readable: #{ctx.units_csv_filename}")
          else
            units_csv_text = File.read(ctx.units_csv_filename)
            units_csv = CSV.parse(units_csv_text, :headers => true)
            ctx.units_csv_hash = units_csv.map(&:to_h)
          end
        end
      end
    end
  end
end
