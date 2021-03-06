module Sass::Script::Functions

  # Returns true when the object is false, an empty string, or an empty list
  def blank(obj)
    case obj
    when Sass::Script::Bool
      Sass::Script::Bool.new !obj.to_bool
    when Sass::Script::String
      Sass::Script::Bool.new obj.value.strip.size == 0
    when Sass::Script::List
      Sass::Script::Bool.new obj.value.size == 0 || obj.value.all?{|el| blank(el).to_bool}
    else
      Sass::Script::Bool.new false
    end
  end

  # Returns a new list after removing any non-true values
  def compact(*args)
    sep = :comma
    if args.size == 1 && args.first.is_a?(Sass::Script::List)
      list = args.first
      args = list.value
      sep = list.separator
    end
    Sass::Script::List.new(args.reject{|a| !a.to_bool}, sep)
  end

  # Get the nth value from a list
  def _compass_nth(list, place)
    assert_type list, :List
    if place.value == "first"
      list.value.first
    elsif place.value == "last"
      list.value.last
    else
      list.value[place.value - 1]
    end
  end

  # Returns a list object from a value that was passed.
  # This can be used to unpack a space separated list that got turned
  # into a string by sass before it was passed to a mixin.
  def _compass_list(arg)
    if arg.is_a?(Sass::Script::List)
      Sass::Script::List.new(arg.value.dup, arg.separator)
    else
      Sass::Script::List.new([arg], :space)
    end
  end

  # If the argument is a list, it will return a new list that is space delimited
  # Otherwise it returns a new, single element, space-delimited list.
  def _compass_space_list(list)
    if list.is_a?(Sass::Script::List)
      Sass::Script::List.new(list.value.dup, :space)
    else
      Sass::Script::List.new([list], :space)
    end
  end

  # Returns the size of the list.
  def _compass_list_size(list)
    assert_list list
    Sass::Script::Number.new(list.value.size)
  end

  # slice a sublist from a list
  def _compass_slice(list, start_index, end_index = nil)
    end_index ||= Sass::Script::Number.new(-1)
    start_index = start_index.value
    end_index = end_index.value
    start_index -= 1 unless start_index < 0
    end_index -= 1 unless end_index < 0
    Sass::Script::List.new list.values[start_index..end_index], list.separator
  end

  # removes the given values from the list.
  def reject(list, *values)
    Sass::Script::List.new(list.value.reject{|v| values.any?{|o| v == o}}, list.separator)
  end

  # returns the first value of a space delimited list.
  def first_value_of(list)
    if list.is_a?(Sass::Script::String)
      Sass::Script::String.new(list.value.split(/\s+/).first)
    elsif defined?(Sass::Script::List) && list.is_a?(Sass::Script::List)
      list.value.first
    else
      list
    end
  end

  protected

  def assert_list(value)
    unless value.is_a?(Sass::Script::List)
      raise ArgumentError.new("#{value.inspect} is not a list")
    end
  end

end
