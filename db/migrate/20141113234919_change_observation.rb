class ChangeObservation < ActiveRecord::Migration
  change_table :observations do |t|
    t.remove :name, :birthdate
  end
end
