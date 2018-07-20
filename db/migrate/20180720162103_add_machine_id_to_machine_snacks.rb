class AddMachineIdToMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    add_reference :machine_snacks, :machine, index: true, foreign_key: true
  end
end
