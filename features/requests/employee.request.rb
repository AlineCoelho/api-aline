class Employee_Requests
  def find_employee
    sleep 10
    Employee.get('/employees')
  end

  def create_employee(name, salary, age)
    @payload_base = {
      'employee_name': name,
      'employee_salary': salary,
      'employee_age': age,
      'profile_image': ''
    }
    # x
    url = "#{$base_url}/create"
    @header = { 'x-api-key' => $key, 'Content-Type' => 'application/json-patch+json' }
    sleep 10
    @response = HTTParty.post(url, headers: @header, body: @payload_base.to_json)
  end

  def update_employee(id, name, salary, age)
    sleep 10
    Employee.put("/update/#{id}", body: {
      'name': name,
      'salary': salary,
      'age': age
    }.to_json)
  end

  def delete_employee(id)
    sleep 10
    Employee.delete("/delete/#{id}")
  end
end
