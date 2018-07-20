class AddSnackIdToMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    add_reference :machine_snacks, :snack, index: true, foreign_key: true
  end
end
