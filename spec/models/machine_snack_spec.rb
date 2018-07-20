require 'rails_helper'

describe MachineSnack, type: :model do
  describe 'relationships' do
    it 'belongs_to a machine' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machinesnack = machine.machine_snacks.create(snack:snack_1)
      expect(machinesnack).to respond_to(:machine)
    end
    it 'belongs_to a snack' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machinesnack = machine.machine_snacks.create(snack:snack_1)
      expect(machinesnack).to respond_to(:snack)
    end
  end
end
