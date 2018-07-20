require 'rails_helper'

describe 'visiting /machines/:id' do
  context "as a user" do
    it 'shows the name of all snacks assocaited with that machine' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machine.machine_snacks.create(snack:snack_1)

      visit "/machines/#{machine.id}"

      expect(page).to have_content snack_1.name
      expect(page).to have_content snack_1.price
    end
    it 'shows the average price of all snacks in that machine' do
      machine = Machine.create(location:'home')
      snack_1 = Snack.create(name:'bar', price:1)
      machine.machine_snacks.create(snack:snack_1)
      snack_2 = Snack.create(name:'cool', price:2)
      machine.machine_snacks.create(snack:snack_2)
      snack_3 = Snack.create(name:'jkhb', price:3)
      machine.machine_snacks.create(snack:snack_3)
      expected = 2

      visit "/machines/#{machine.id}"

      expect(page).to have_content "Average Snack Price: #{expected}"
    end
  end
end
