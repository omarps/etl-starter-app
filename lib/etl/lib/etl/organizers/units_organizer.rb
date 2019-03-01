require_relative '../actions/json/units_parser_flattener_action'
require_relative '../actions/json/unit_amenities_action'
require_relative '../actions/json/units_action'
require_relative '../actions/csv/units_parser_action'
require_relative '../actions/csv/unit_groups_action'
require_relative '../actions/csv/units_action'

module Etl
  module Organizers
    class UnitsOrganizer
      extend ::LightService::Organizer
      
      def self.call(texts_hash)
        with(texts_hash).reduce(
          ::Etl::Actions::Json::UnitsParserFlattenerAction,
          ::Etl::Actions::Json::UnitAmenitiesAction,
          ::Etl::Actions::Json::UnitsAction,
          ::Etl::Actions::Csv::UnitsParserAction,
          ::Etl::Actions::Csv::UnitGroupsAction,
          ::Etl::Actions::Csv::UnitsAction
        )
      end
    end
  end
end