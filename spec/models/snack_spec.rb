require 'rails_helper'

describe Snack, type: :model do
  describe 'relationships' do
    it 'has_many machines' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machinesnack = machine.machine_snacks.create(snack:snack_1)
      expect(snack_1).to respond_to(:machines)
    end
  end
end
