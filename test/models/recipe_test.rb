require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def recipe
    @recipe ||= Recipe.new
  end

  def test_valid
    assert recipe.valid?
  end
end
