require './decorator_class'

# this class make sure that return the name capitilize
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
