require_relative '../actions/json/unit_groups_parser_action'
require_relative '../actions/json/invoiceable_fees_action'
require_relative '../actions/json/channel_rate_action'
require_relative '../actions/json/unit_type_action'
require_relative '../actions/json/discounts_action'
require_relative '../actions/json/controls_action'
require_relative '../actions/json/client_applications_action'
require_relative '../actions/json/discount_plans_actions'
require_relative '../actions/json/unit_groups_action'

module Etl
  module Organizers
    class UnitGroupsOrganizer
      extend ::LightService::Organizer
      
      def self.call(unit_groups_filename)
        with(:unit_groups_filename => unit_groups_filename).reduce(
          ::Etl::Actions::Json::UnitGroupsParserAction,
          ::Etl::Actions::Json::InvoiceableFeesAction,
          ::Etl::Actions::Json::ChannelRateAction,
          ::Etl::Actions::Json::UnitTypeAction,
          ::Etl::Actions::Json::DiscountsAction,
          ::Etl::Actions::Json::ControlsAction,
          ::Etl::Actions::Json::ClientApplicationsAction,
          ::Etl::Actions::Json::DiscountPlansAction,
          ::Etl::Actions::Json::UnitGroupsAction
        )
      end
    end
  end
end
