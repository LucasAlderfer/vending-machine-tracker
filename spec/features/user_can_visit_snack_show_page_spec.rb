require 'rails_helper'

describe 'visiting /snacks/:id' do
  context "as a user" do
    it 'shows the name of the snack, price of the snack' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machine.machine_snacks.create(snack:snack_1)

      visit "/snacks/#{snack_1.id}"

      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_1.price)
    end
    it 'shows the locations of all machines holding that snack' do
      machine_1 = Machine.create(location:'home')
      machine_2 = Machine.create(location:'away')
      snack_1 = Snack.create(name:'bar', price:1)
      machine_1.machine_snacks.create(snack:snack_1)
      machine_2.machine_snacks.create(snack:snack_1)

      visit "/snacks/#{snack_1.id}"

      expect(page).to have_content(machine_1.location)
      expect(page).to have_content(machine_2.location)
    end
    it 'shows the average prices of all snacks in each machine' do
      machine_1 = Machine.create(location:'home')
      machine_2 = Machine.create(location:'away')
      snack_1 = Snack.create(name:'bar', price:1)
      snack_2 = Snack.create(name:'cool', price:3)
      machine_1.machine_snacks.create(snack:snack_1)
      machine_2.machine_snacks.create(snack:snack_1)
      machine_1.machine_snacks.create(snack:snack_2)
      machine_2.machine_snacks.create(snack:snack_2)

      visit "/snacks/#{snack_1.id}"

      expect(page).to have_content(machine_1.average_snack_price)
      expect(page).to have_content(machine_2.average_snack_price)
    end
    it 'shows the number of snacks in each machine' do
      machine_1 = Machine.create(location:'home')
      machine_2 = Machine.create(location:'away')
      snack_1 = Snack.create(name:'bar', price:1)
      snack_2 = Snack.create(name:'cool', price:3)
      machine_1.machine_snacks.create(snack:snack_1)
      machine_2.machine_snacks.create(snack:snack_1)
      machine_1.machine_snacks.create(snack:snack_2)
      machine_2.machine_snacks.create(snack:snack_2)

      visit "/snacks/#{snack_1.id}"

      expect(page).to have_content(machine_1.snack_count)
      expect(page).to have_content(machine_2.snack_count)
    end
  end
end
