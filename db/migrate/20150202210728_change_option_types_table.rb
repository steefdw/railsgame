class ChangeOptionTypesTable < ActiveRecord::Migration
  def change
    rename_table :optiontypes, :option_types
    rename_column :options, :optiontype_id, :option_type_id
  end
end
