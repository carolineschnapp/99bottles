require 'pry-byebug'

class Bottles
  def song
    verses(99, 0)
  end

  def verses(high, low)
    high.downto(low).map do |index|
      verse(index)
    end
      .join("\n")
  end

  def verse(n)
    <<~VERSE
      #{self.class.x_amount_of_bottle(n).capitalize} of beer on the wall, #{self.class.x_amount_of_bottle(n)} of beer.
      #{self.class.instruction(n)}, #{self.class.x_amount_of_bottle(n - 1)} of beer on the wall.
    VERSE
  end

  private

  class << self
    def x_amount_of_bottle(amount)
      if amount == -1
        "99 bottles"
      elsif amount == 0
        "no more bottles"
      elsif amount == 1
        "1 bottle"
      else
        "#{amount} bottles"
      end
    end

    def instruction(number_of_bottles_we_started_with)
      if number_of_bottles_we_started_with == 0
        'Go to the store and buy some more'
      elsif number_of_bottles_we_started_with == 1
        'Take it down and pass it around'
      else
        'Take one down and pass it around'
      end
    end
  end
end
