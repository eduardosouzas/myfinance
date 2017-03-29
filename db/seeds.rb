# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    puts "Cadastrando o Usuario Padrão..."

    user = User.new(
      email: "membro@membro.com",
      password: "123456",
      password_confirmation: "123456"
    )

      user.build_profile_user

      user.profile_user.first_name = Faker::Name.first_name
      user.profile_user.second_name = Faker::Name.last_name

      user.save!

      puts "Usuario cadastrado com sucesso!"
