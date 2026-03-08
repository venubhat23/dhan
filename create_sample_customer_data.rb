#!/usr/bin/env ruby
# Sample data creation script for Customer Web Application

puts "🌱 Creating sample data for Customer Web Application..."

# Create sample categories if they don't exist
if Category.count == 0
  puts "📁 Creating sample categories..."

  milk_cat = Category.create!(
    name: "Fresh Milk",
    description: "Fresh and organic milk products",
    status: true,
    display_order: 1
  )

  grocery_cat = Category.create!(
    name: "Groceries",
    description: "Daily essentials and groceries",
    status: true,
    display_order: 2
  )

  fruits_cat = Category.create!(
    name: "Fruits & Vegetables",
    description: "Fresh fruits and vegetables",
    status: true,
    display_order: 3
  )

  puts "✅ Created #{Category.count} categories"
else
  puts "📁 Categories already exist (#{Category.count})"
  milk_cat = Category.find_by(name: "Fresh Milk") || Category.first
  grocery_cat = Category.find_by(name: "Groceries") || Category.second
  fruits_cat = Category.find_by(name: "Fruits & Vegetables") || Category.third
end

# Create sample products if they don't exist
if Product.count < 10
  puts "🛍️  Creating sample products..."

  # Milk Products
  Product.create!([
    {
      name: "Fresh Cow Milk",
      description: "Pure and fresh cow milk delivered daily",
      category: milk_cat,
      price: 60,
      discount_price: 55,
      stock: 100,
      sku: "MILK001",
      status: 'active',
      product_type: 'Milk',
      unit_type: 'Liter',
      weight: 1,
      is_subscription_enabled: true
    },
    {
      name: "Organic Buffalo Milk",
      description: "Rich and creamy organic buffalo milk",
      category: milk_cat,
      price: 80,
      stock: 50,
      sku: "MILK002",
      status: 'active',
      product_type: 'Milk',
      unit_type: 'Liter',
      weight: 1,
      is_subscription_enabled: true
    }
  ])

  # Grocery Products
  Product.create!([
    {
      name: "Organic Rice",
      description: "Premium quality organic basmati rice",
      category: grocery_cat,
      price: 120,
      discount_price: 110,
      stock: 75,
      sku: "GRC001",
      status: 'active',
      product_type: 'Grocery',
      unit_type: 'Kg',
      weight: 1
    },
    {
      name: "Whole Wheat Flour",
      description: "Fresh ground whole wheat flour",
      category: grocery_cat,
      price: 45,
      stock: 100,
      sku: "GRC002",
      status: 'active',
      product_type: 'Grocery',
      unit_type: 'Kg',
      weight: 1
    },
    {
      name: "Organic Pulses Mix",
      description: "Mixed organic pulses for healthy cooking",
      category: grocery_cat,
      price: 95,
      discount_price: 85,
      stock: 60,
      sku: "GRC003",
      status: 'active',
      product_type: 'Grocery',
      unit_type: 'Kg',
      weight: 1
    }
  ])

  # Fruits & Vegetables
  Product.create!([
    {
      name: "Fresh Bananas",
      description: "Sweet and ripe bananas",
      category: fruits_cat,
      price: 40,
      stock: 200,
      sku: "FRT001",
      status: 'active',
      product_type: 'Fruit & Vegetable',
      unit_type: 'Kg',
      weight: 1
    },
    {
      name: "Organic Apples",
      description: "Crisp and juicy organic apples",
      category: fruits_cat,
      price: 150,
      discount_price: 135,
      stock: 80,
      sku: "FRT002",
      status: 'active',
      product_type: 'Fruit & Vegetable',
      unit_type: 'Kg',
      weight: 1
    },
    {
      name: "Fresh Spinach",
      description: "Farm fresh green spinach",
      category: fruits_cat,
      price: 25,
      stock: 150,
      sku: "VEG001",
      status: 'active',
      product_type: 'Fruit & Vegetable',
      unit_type: 'Kg',
      weight: 0.5
    }
  ])

  puts "✅ Created sample products (#{Product.count} total)"
else
  puts "🛍️  Products already exist (#{Product.count})"
end

# Create sample banner if it doesn't exist
if Banner.count == 0
  puts "🎯 Creating sample banner..."

  Banner.create!(
    title: "Welcome to Dhanvantri Naturals",
    description: "Fresh milk, organic groceries and natural products delivered to your doorstep. Experience healthy living with premium quality products.",
    display_start_date: Date.current,
    display_end_date: 1.month.from_now,
    display_location: 'homepage',
    status: true,
    display_order: 1,
    redirect_link: ''
  )

  puts "✅ Created sample banner"
else
  puts "🎯 Banner already exists"
end

# Create a sample test customer if it doesn't exist
if Customer.find_by(email: 'test@customer.com').nil?
  puts "👤 Creating test customer..."

  customer = Customer.create!(
    first_name: 'Test',
    last_name: 'Customer',
    email: 'test@customer.com',
    mobile: '9876543999',
    password: 'password123',
    password_confirmation: 'password123',
    address: '123 Test Street, Test City'
  )

  # Create a sample address for the customer
  customer.customer_addresses.create!(
    name: 'Test Customer',
    mobile: '9876543210',
    address_type: 'home',
    address: '123 Test Street, Test Area',
    landmark: 'Near Test Mall',
    city: 'Mumbai',
    state: 'Maharashtra',
    pincode: '400001',
    is_default: true
  )

  puts "✅ Created test customer: test@customer.com / password123"
else
  puts "👤 Test customer already exists"
end

puts ""
puts "🎉 Sample data creation completed!"
puts ""
puts "📋 Summary:"
puts "   Categories: #{Category.count}"
puts "   Products: #{Product.count}"
puts "   Banners: #{Banner.count}"
puts "   Customers: #{Customer.count}"
puts ""
puts "🔗 Customer Web Application URLs:"
puts "   Login: http://localhost:3000/customer/login"
puts "   Register: http://localhost:3000/customer/register"
puts "   Homepage: http://localhost:3000/customer/"
puts ""
puts "👤 Test Customer Credentials:"
puts "   Email: test@customer.com"
puts "   Password: password123"
puts ""
puts "✨ Ready to test the Customer Web Application!"