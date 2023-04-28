# get
Dado('que o usuario consulte informacoes de funcionario') do
  @getlist = Employee_Requests.new
end

Quando('ele realiza a pesquisa') do
  @list_employee = @getlist.find_employee
end

Entao('uma lista de funcionarios deve retornar') do
  expect(@list_employee.code).to eq 200
  expect(@list_employee.message).to eql 'OK'
end
#####################################################################################
# post
Dado('que o usuario cadastre um novo funcionario') do
  @post_url = 'https://dummy.restapiexample.com/api/v1/create'
end

Quando('ele enviar as informacoes do funcionario') do
  @create = Employee_Requests.new
  sleep 10
  @create_employee = @create.create_employee('Tony', '420800', '30')
  puts @create_employee
end

Então('esse funcionario sera cadastrado') do
  puts "Code: #{@create_employee.code}"
  expect(@create_employee.code).to eql(200)
  expect(@create_employee.msg).to eql 'OK'
  expect(@create_employee['status']).to eql 'success'
  expect(@create_employee['message']).to eql 'Successfully! Record has been added.'
  expect(@create_employee.parsed_response['data']['employee_name']).to eql 'Tony'
  expect(@create_employee.parsed_response['data']['employee_salary']).to eql('420800')
  expect(@create_employee.parsed_response['data']['employee_age']).to eql('30')
end
####################################################################
# put
Dado('que o usuario altere uma informacao de funcionario') do
  @request = Employee_Requests.new
end

Quando('ele enviar as novas informacoes') do
  @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], 'Alberto', '100', '40')
  puts(@update_employee)
end

Então('as informacoes serao alteradas') do
  expect(@update_employee.code).to eql(200)
  expect(@update_employee.msg).to eql 'OK'
  expect(@update_employee['status']).to eql 'success'
  expect(@update_employee['message']).to eql 'Successfully! Record has been updated.'
  expect(@update_employee.parsed_response['data']['name']).to eql 'Alberto'
  expect(@update_employee.parsed_response['data']['salary']).to eql('100')
  expect(@update_employee.parsed_response['data']['age']).to eql('40')
end
#####################################################################################
# delete
Dado('que o usuario queira deletar um funcionario') do
  @request = Employee_Requests.new
  @get_url = 'https://dummy.restapiexample.com/api/v1/employees'
  @list_employee = HTTParty.get(@get_url)
  puts "Code: #{@list_employee}"
  @id_employee = @list_employee['data'][0]['id'].to_s
  puts "Code: #{@id_employee}"
  @delete_url = "https://dummy.restapiexample.com/api/v1/delete/#{@id_employee}"
end

Quando('ele enviar a identificacao unica') do
  @delete_employee = @request.delete_employee(@id_employee)
end

Então('esse funcionario sera deletado do sistema') do
  expect(@delete_employee.code).to eql(200)
  expect(@delete_employee.msg).to eql 'OK'
  expect(@delete_employee['status']).to eql 'success'
  # expect(@delete_employee.parsed_response['data']).to eql '27'
  expect(@delete_employee['message']).to eql 'Successfully! Record has been deleted'
end
