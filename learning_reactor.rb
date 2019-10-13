class LearningReactor
  REGEXP = /(?<words>.+)は(?<meaning>.+)/

  def initialize(knowledge)
    @knowledge = knowledge
  end

  def accept?(text)
    text.match?(REGEXP)
  end

  def react(text)
    match = REGEXP.match(text)
    words = match[:words]
    meaning = match[:meaning]
    @knowledge.learn(words, meaning)
    "`#{words}` を `#{meaning}` という意味で覚えたよ！"
  end
end