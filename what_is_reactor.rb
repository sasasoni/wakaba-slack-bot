class WhatIsReactor
  RE = /^(?<words>.+)ってどういう意味(\?|？)$/

  def initialize(knowledge)
    @knowledge = knowledge
  end

  def accept?(text)
    text.match? RE
  end

  def react(text)
    words = RE.match(text)[:words]
    meaning = @knowledge.meaning(words)
    if meaning
      "`#{words}` は `#{meaning}` ということじゃ"
    else
      "`#{words}` は知らないよ！"
    end
  end
end