require './decorator'

# this class make sure that return the name trimmed
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0...10]
  end
end
