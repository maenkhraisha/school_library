# frozen_string_literal: true

require './decorator'

# this class make sure that return the name capitilize
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
