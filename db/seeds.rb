# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', email: 'tom@mail.com', password: '123asd')
first_user.password_confirmation = '123asd'
first_user.confirm

second_user = User.create(name: 'Lilly', email: 'lilly@mail.com', password: '123asd')
second_user.password_confirmation = '123asd'
second_user.confirm

first_food = Food.create(
        name: 'Food 1-1', 
        measurement_unit: 'kg', 
        price: 6.50,
        quantity: 10,
        user_id: first_user.id)

second_food = Food.create(
        name: 'Food 1-2', 
        measurement_unit: 'gr', 
        price: 2.50,
        quantity: 5,
        user_id: first_user.id)

third_food = Food.create(
        name: 'Food 1-3', 
        measurement_unit: 'kg', 
        price: 10.20,
        quantity: 15,
        user_id: first_user.id)

fourth_food = Food.create(
        name: 'Food 2-1', 
        measurement_unit: 'kg', 
        price: 4.50,
        quantity: 12,
        user_id: second_user.id)
  
fifth_food = Food.create(
        name: 'Food 2-2', 
        measurement_unit: 'gr', 
        price: 12.50,
        quantity: 20,
        user_id: second_user.id)
  
sixth_food = Food.create(
        name: 'Food 2-3', 
        measurement_unit: 'kg', 
        price: 15.20,
        quantity: 30,
        user_id: second_user.id)

first_recipe = Recipe.create(
        name: 'Recipe 1-1', 
        preparion_time: '120', 
        cooking_time: '60',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
        public: true,
        user_id: first_user.id)

second_recipe = Recipe.create(
        name: 'Recipe 1-2', 
        preparion_time: '60', 
        cooking_time: '30',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industrys standard dummy text ever since the 1500s. ',
        public: false,
        user_id: first_user.id)

third_recipe = Recipe.create(
        name: 'Recipe 2-1', 
        preparion_time: '100', 
        cooking_time: '120',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industrys standard dummy text ever since the 1500s. ',
        public: true,
        user_id: second_user.id)

fourth_recipe = Recipe.create(
        name: 'Recipe 2-1', 
        preparion_time: '30', 
        cooking_time: '15',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industrys standard dummy text ever since the 1500s. ',
        public: false,
        user_id: second_user.id)
  
first_recipe_food = RecipeFood.create(
        quantity: 10,
        recipe_id: first_recipe.id,
        food_id: first_food.id)

second_recipe_food = RecipeFood.create(
        quantity: 5,
        recipe_id: first_recipe.id,
        food_id: second_food.id)

third_recipe_food = RecipeFood.create(
        quantity: 10,
        recipe_id: third_recipe.id,
        food_id: first_food.id)
  
fourd_recipe_food = RecipeFood.create(
        quantity: 5,
        recipe_id: third_recipe.id,
        food_id: fifth_food.id)
