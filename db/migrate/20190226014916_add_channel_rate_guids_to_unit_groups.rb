class AddChannelRateGuidsToUnitGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :unit_groups, :channel_rate_guids, :text, default: [].to_yaml, array:true
  end
end
