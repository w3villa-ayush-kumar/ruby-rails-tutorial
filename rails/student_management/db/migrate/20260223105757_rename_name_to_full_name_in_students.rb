class RenameNameToFullNameInStudents < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :name, :full_name
  end
end
