class Bottles
  def verses(x, y)
    song = (x..y).inject('') do |result, index|
      result << verse(index)
    end
    song.chomp
  end

  def verse(x)
    <<~VERSE
      #{self.class.x_amount_of_bottle(x).capitalize} of beer on the wall, #{self.class.x_amount_of_bottle(x)} of beer.
      #{self.class.instruction(x)}, #{self.class.x_amount_of_bottle(x - 1)} of beer on the wall.
    VERSE
  end

  def self.x_amount_of_bottle(amount)
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

  def self.instruction(start)
    if start == 0
      'Go to the store and buy some more'
    elsif start == 1
      'Take it down and pass it around'
    else
      'Take one down and pass it around'
    end
  end
end
