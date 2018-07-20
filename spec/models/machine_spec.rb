require 'rails_helper'

describe Machine, type: :model do
  describe 'relationships' do
    it 'has_many snacks' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machinesnack = machine.machine_snacks.create(snack:snack_1)
      expect(machine).to respond_to(:snacks)
    end
  end
  describe 'instance methods' do
    it 'has an average snack price' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machine.machine_snacks.create(snack:snack_1)
      snack_2 = Snack.create(name:'cool', price:2)
      machine.machine_snacks.create(snack:snack_2)
      snack_3 = Snack.create(name:'jkhb', price:3)
      machine.machine_snacks.create(snack:snack_3)
      expected = 2

      expect(machine.average_snack_price).to eq expected
    end
    it 'has a snack count' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machine.machine_snacks.create(snack:snack_1)
      snack_2 = Snack.create(name:'cool', price:2)
      machine.machine_snacks.create(snack:snack_2)
      snack_3 = Snack.create(name:'jkhb', price:3)
      machine.machine_snacks.create(snack:snack_3)
      expected = 3

      expect(machine.snack_count).to eq expected
    end
  end
end
