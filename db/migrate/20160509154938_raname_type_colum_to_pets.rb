class RanameTypeColumToPets < ActiveRecord::Migration
  def change
  	rename_column :pets, :type, :pettype
  end
end
