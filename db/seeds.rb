# frozen_string_literal: true

# Create users

User.create(
  email: "admin@example.com",
  password: "pass123",
  password_confirmation: "pass123",
  confirmed_at: Time.now,
  admin: true
)

User.create(
  email: "user@example.com",
  password: "pass123",
  password_confirmation: "pass123",
  confirmed_at: Time.now,
  admin: false
)
