require 'pry-byebug'

class BottlesNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def action
    if number == 0
      'Go to the store and buy some more'
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def quantity
    if number == 0
      'no more'
    else
      number.to_s
    end
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def successor
    new_number = if number == 0
      99
    else
      number - 1
    end
    self.class.new(new_number)
  end
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, finish)
    start.downto(finish).map do |index|
      verse(index)
    end
      .join("\n")
  end

  def verse(number)
    bottles_number = BottlesNumber.new(number)
    next_bottles_number = bottles_number.successor
    <<~VERSE
      #{bottles_number.quantity.capitalize} #{bottles_number.container} of beer on the wall, #{bottles_number.quantity} #{bottles_number.container} of beer.
      #{bottles_number.action}, #{next_bottles_number.quantity} #{next_bottles_number.container} of beer on the wall.
    VERSE
  end
end
