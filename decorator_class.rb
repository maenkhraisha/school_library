# frozen_string_literal: true

require './nameable_class'

# this class is the wrapper of the decorated classes
class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end
