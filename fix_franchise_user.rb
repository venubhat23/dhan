#!/usr/bin/env ruby

puts '🔧 FIXING FRANCHISE USER ISSUES'
puts '=' * 50

email = '903342rewweewrrewrew93939393fdfds@gmail.com'
user = User.find_by(email: email)

if user
  puts "Found user: #{user.email}"

  # Find or create franchise record
  franchise = Franchise.find_by(email: email)

  if franchise
    puts "✅ Found existing franchise: #{franchise.name}"

    # Associate user with franchise
    user.update!(
      authenticatable: franchise,
      authenticatable_type: 'Franchise',
      authenticatable_id: franchise.id
    )

    puts "✅ Updated user-franchise association"
  else
    puts "❌ No franchise record found. Creating one..."

    # Create franchise record
    franchise = Franchise.create!(
      name: user.company_name || 'Default Franchise',
      contact_person_name: "#{user.first_name} #{user.last_name}",
      email: user.email,
      mobile: user.mobile,
      address: user.address || 'Default Address',
      city: user.city || 'Bangalore',
      state: user.state || 'Karnataka',
      status: true
    )

    # Associate user with franchise
    user.update!(
      authenticatable: franchise,
      authenticatable_type: 'Franchise',
      authenticatable_id: franchise.id
    )

    puts "✅ Created franchise and updated association"
  end

  # Set sidebar permissions for franchise user
  franchise_permissions = {
    'dashboard' => { 'view' => true, 'create' => false, 'edit' => false, 'delete' => false },
    'bookings' => { 'view' => true, 'create' => true, 'edit' => true, 'delete' => false },
    'customers' => { 'view' => true, 'create' => true, 'edit' => true, 'delete' => false }
  }

  user.update!(sidebar_permissions: franchise_permissions.to_json)
  puts "✅ Updated sidebar permissions"

  # Verify the changes
  puts "\n✅ VERIFICATION:"
  puts "   Franchise Association: #{user.authenticatable&.name}"
  puts "   Has Dashboard Permission: #{user.has_sidebar_permission?('dashboard')}"
  puts "   Has Bookings Permission: #{user.has_sidebar_permission?('bookings')}"
  puts "   Has Customers Permission: #{user.has_sidebar_permission?('customers')}"

else
  puts '❌ User not found'
end