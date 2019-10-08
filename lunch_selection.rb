class LunchSelection
  def accept?(dice_type)
    dice_type == 'ランチ'
  end

  def possibilities(client, data)
    [
      'ラーメン',
      'カレー',
      'ハンバーガー'
    ]
  end
end