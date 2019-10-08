class Dice
  def accept?(dice_type)
    true
  end

  EMOJI = [
            ':one:',
            ':two:',
            ':three:',
            ':four:',
            ':five:',
            ':six:'
          ]

  def possibilities(client, data)
    6.times.map {|i| "サイコロの目は#{EMOJI[i]}です"}
  end
end