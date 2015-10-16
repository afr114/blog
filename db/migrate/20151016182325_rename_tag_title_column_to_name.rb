class RenameTagTitleColumnToName < ActiveRecord::Migration
  def change
    rename_column :tags, :title, :name
  end
end
