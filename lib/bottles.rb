# frozen_string_literal: true

require 'pry-byebug'

class BottleNumber
  attr_reader :number

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    when 6
      BottleNumber6
    else
      BottleNumber
    end
      .new(number)
  end

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def action
    'Take one down and pass it around'
  end

  def quantity
    number
  end

  def container
    'bottles'
  end

  def successor
    BottleNumber.for(number - 1)
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def action
    'Take it down and pass it around'
  end

  def container
    'bottle'
  end
end

class BottleNumber6 < BottleNumber
  def quantity
    1
  end

  def container
    'six-pack'
  end
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, finish)
    start
      .downto(finish).map do |index|
        verse(index)
      end
      .join("\n")
  end

  def verse(number)
    bottles = BottleNumber.for(number)
    <<~VERSE
      #{bottles.to_s.capitalize} of beer on the wall, #{bottles} of beer.
      #{bottles.action}, #{bottles.successor} of beer on the wall.
    VERSE
  end
end
