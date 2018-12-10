author_1 = Author.create(name: Faker::Book.unique.author)
author_2 = Author.create(name: Faker::Book.unique.author)
author_3 = Author.create(name: Faker::Book.unique.author)
author_4 = Author.create(name: Faker::Book.unique.author)
author_5 = Author.create(name: Faker::Book.unique.author)
author_6 = Author.create(name: Faker::Book.unique.author)


book_1 = Book.create(authors: [author_1], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_2 = Book.create(authors: [author_1, author_2], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_3 = Book.create(authors: [author_2], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_4 = Book.create(authors: [author_3], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_5 = Book.create(authors: [author_3, author_4], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_6 = Book.create(authors: [author_4], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_7 = Book.create(authors: [author_5], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_8 = Book.create(authors: [author_4, author_5], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_9 = Book.create(authors: [author_6], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_10 = Book.create(authors: [author_3, author_6], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_11 = Book.create(authors: [author_1, author_5], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)
book_12 = Book.create(authors: [author_5], title: Faker::Book.unique.title, pages: Faker::Number.number(3), published_year: Faker::Stripe.year)

user_1 = User.create(name: Faker::Internet.username(9..15))
user_2 = User.create(name: Faker::Internet.username(9..15))
user_3 = User.create(name: Faker::Internet.username(9..15))
user_4 = User.create(name: Faker::Internet.username(9..15))
user_5 = User.create(name: Faker::Internet.username(9..15))

review_1 = Review.create(user: user_1, book: book_1, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_2 = Review.create(user: user_2, book: book_2, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_3 = Review.create(user: user_3, book: book_2, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_4 = Review.create(user: user_4, book: book_3, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_5 = Review.create(user: user_5, book: book_3, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_6 = Review.create(user: user_5, book: book_3, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_7 = Review.create(user: user_2, book: book_4, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_8 = Review.create(user: user_3, book: book_4, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_9 = Review.create(user: user_4, book: book_4, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_10 = Review.create(user: user_5, book: book_4, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_11 = Review.create(user: user_5, book: book_5, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_12 = Review.create(user: user_4, book: book_5, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_13 = Review.create(user: user_3, book: book_1, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_14 = Review.create(user: user_4, book: book_2, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_15 = Review.create(user: user_5, book: book_3, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_16 = Review.create(user: user_2, book: book_4, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_17 = Review.create(user: user_2, book: book_5, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_18 = Review.create(user: user_5, book: book_6, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_19 = Review.create(user: user_5, book: book_7, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_20 = Review.create(user: user_5, book: book_8, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_21 = Review.create(user: user_5, book: book_9, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_22 = Review.create(user: user_5, book: book_10, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_23 = Review.create(user: user_5, book: book_11, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
review_24 = Review.create(user: user_5, book: book_12, title: Faker::Food.dish, description: Faker::Hacker.say_something_smart, rating: (Faker::Number.between(1,10) / 2.to_f))
