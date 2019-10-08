class Fortune
  def accept?(dice_type)
    dice_type == '占い'
  end

  def possibilities(client, data)
    [
      '大吉😇',
      '中吉😀',
      '吉🙂',
      '凶😞',
      '大凶😭'
    ]
  end
end