User.create!(first_name: "Alexei",
last_name: "Dagadag",
email: "al@a.com",
password: '123456',
password_confirmation: "123456")

User.create!(first_name: "Mike",
last_name: "Maerson",
email: "a@a.com",
password: '123456',
password_confirmation: "123456")

User.create!(first_name: "Ben",
last_name: "Stiller",
email: "a1@a.com",
password: '123456',
password_confirmation: "123456")

User.create!(email: "admin@example.com",
password: "password",
password_confirmation: "password")

Album.create(title:"Title 6",
description: "Description 4",
user: User.second)

Album.create(title:"Title 63",
description: "Description 432",
user: User.first)

Album.create(title:"Title 3263",
description: "Description 44332",
user: User.first)

Album.create(title:"Title 64323",
description: "Description 432543",
user: User.second)

Album.create(title:"Title 643223",
description: "Description 432543",
user: User.second)

Album.create(title:"Title 65433",
description: "Description 432543",
user: User.second)

Album.create(title:"Title 644323",
description: "Description 43254432243 this is",
user: User.second)

Album.create(title:"Title 5435",
description: "Description 432543",
user: User.third)

Album.create(title:"Title 432423",
description: "Description 432543",
user: User.third)

Album.create(title:"Title 24314",
description: "Description 432543",
user: User.third)

