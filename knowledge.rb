class Knowledge
  def initialize
    @known_things = {}
  end

  def meaning(words)
    @known_things[words]
  end

  def learn(words, meaning)
    @known_things[words] = meaning
  end
end