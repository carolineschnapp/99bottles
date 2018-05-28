require 'pry-byebug'

class BottlesNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
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
      number
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
    bottles = BottlesNumber.new(number)
    next_bottles = bottles.successor
    <<~VERSE
      #{bottles.to_s.capitalize} of beer on the wall, #{bottles} of beer.
      #{bottles.action}, #{next_bottles} of beer on the wall.
    VERSE
  end
end
