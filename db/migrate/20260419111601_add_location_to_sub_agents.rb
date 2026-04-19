class AddLocationToSubAgents < ActiveRecord::Migration[8.0]
  def change
    add_column :sub_agents, :longitude, :decimal
    add_column :sub_agents, :latitude, :decimal
  end
end
