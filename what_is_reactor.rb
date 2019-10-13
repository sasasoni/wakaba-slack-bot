class WhatIsReactor
  RE = /^(?<words>.+)ってどういう意味(\?|？)$/

  def initialize(knowledge)
    @knowledge = knowledge
  end

  def accept?(text, morphemes)
    text.match? RE
  end

  def react(text, morphemes)
    words = RE.match(text)[:words]
    meaning = @knowledge.meaning(words)
    if meaning
      "`#{words}` は `#{meaning}` ということじゃ"
    else
      "`#{words}` は知らないよ！"
    end
  end
end