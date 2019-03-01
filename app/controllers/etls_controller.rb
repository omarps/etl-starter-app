
class EtlsController < ApplicationController
  def index
    if params[:etl] == 'unit_groups.json'
      unit_groups_text = File.read('./data/json/unit_groups.json')
      service_result = Etl::Organizers::UnitGroupsOrganizer.call(unit_groups_text)
    end
    
    if params[:etl] == 'units.json'
      units_json_text_array = []
      Dir['./data/json/*_units.json'].each do |unit_group_unit_json|
        units_json_text_array << File.read(unit_group_unit_json)
      end
      units_csv_text = File.read('./data/csv/units.csv')
      service_result = Etl::Organizers::UnitsOrganizer.call(
        units_json_text_array: units_json_text_array,
        units_csv_text: units_csv_text
      )
    end
  end
end