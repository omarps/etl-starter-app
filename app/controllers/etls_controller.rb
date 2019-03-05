
class EtlsController < ApplicationController
  def index
    if params[:etl] == 'unit_groups.json'
      service_result = Etl::Organizers::UnitGroupsOrganizer.call(
        './data/json/unit_groups.json'
      )
    end
    
    if params[:etl] == 'units.json'
      service_result = Etl::Organizers::UnitsOrganizer.call(
        units_json_dirpath: './data/json/*_units.json',
        unit_groups_csv_filename: './data/csv/units.csv'
      )
    end
  end
end