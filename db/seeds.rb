Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
    load seed
end

user = User.where(email: "test@test.com").first_or_initialize
user.update!(
    password: "password",
    password_confirmation: "password"
)