#User test account

User.create(username: "AshleyP", email:"ashley.p@email.com", password: "password1", password_confirmation: "password1")

#user accounts
50.times do
    User.create(
        username: Faker::Internet.user_name,
        email: Faker::Internet.email,
        password: "password1",
        password_confirmation: "password1"
    )
end

#treks
200.times do
    Trek.create(
        name: Faker::Space.agency,
        location: Faker::Pokemon.location,
        user_id: Faker::Number.between(from: 1, to: 51)
    )
end