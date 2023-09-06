require 'rails_helper'

RSpec.describe 'Recipe Foods', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Anna', email: 'vera101@gmail.com', password: 'password') }
  let(:food) { Food.create(user_id: user.id, name: 'Rice', measurement_unit: 'kg', price: 40) }
  let(:recipe) do
    Recipe.create(name: 'Thai Rice', cooking_time: 1, preparation_time: 2, description: 'description', public: true,
                  user_id: user.id)
  end
  let(:recipe_food) { RecipeFood.create(quantity: 10, food_id: food.id, recipe_id: recipe.id) }

  describe 'GET /index' do
    before do
      sign_in user
    end
    it 'should check if recipe with name "Thai Rice" exists' do
      expect(recipe.name).to eq('Thai Rice')
    end

    it 'should check prepationTime of recipe with name "Thai Rice"' do
      expect(recipe.preparation_time).to eq(2)
    end

    it 'should check Preparation Time of recipe with name "Thai Rice"' do
      expect(recipe.cooking_time).to eq(1)
    end

    it 'should check if recipe_food with quantity 10 exists' do
      expect(recipe_food.quantity).to eq(10)
    end
  end
end
