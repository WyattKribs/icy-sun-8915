require 'rails_helper'

RSpec.describe 'department show page' do

  it "can tell you the name and floor of the department" do
    department_1 = Department.create(name: "Receiving", floor: "1st")

    visit "/departments/#{department_1.id}"

    expect(page).to have_content("Receiving Department on the 1st floor")
  end

  it 'Has the name and level of each employee in the department' do
    department_1 = Department.create(name: "Receiving", floor: "1st")
    department_2 = Department.create(name: "Mail", floor: "Basement")
    employee_1 = Employee.create(name: "Gunther Guyman", level: 2,
    department_id: department_1.id)
    employee_2 = Employee.create(name: "Becky Briar", level: 3,
    department_id: department_1.id)
    employee_3 = Employee.create(name: "Marge Waters", level: 2,
       department_id: department_2.id)

    visit "/departments/#{department_1.id}"

    expect(page).to have_content("Gunther Guyman level: 2")
    expect(page).to have_content("Becky Briar level: 3")
    expect(page).to_not have_content("Mage Waters level: 3")
  end
end
