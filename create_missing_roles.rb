puts 'Creating missing roles for user types...'

roles_to_create = [
  { name: 'data_entry', display_name: 'Data Entry', description: 'Access to add and modify customer and policy data' },
  { name: 'tele_calling', display_name: 'Tele Calling', description: 'Access to leads and customer communication features' },
  { name: 'accounts', display_name: 'Accounts', description: 'Access to financial reports and commission management' },
  { name: 'super_admin', display_name: 'Super Admin', description: 'Full system access and administration' }
]

roles_to_create.each do |role_data|
  existing_role = Role.find_by(name: role_data[:name])

  if existing_role
    puts "✅ Role '#{role_data[:display_name]}' already exists (ID: #{existing_role.id})"
  else
    role = Role.create!(
      name: role_data[:name],
      description: role_data[:description],
      status: true
    )
    puts "✅ Created role '#{role_data[:display_name]}' (ID: #{role.id})"
  end
end

puts "\n📊 Updated role list:"
Role.all.each do |role|
  puts "  - #{role.name} (#{role.display_name}) - ID: #{role.id}"
end