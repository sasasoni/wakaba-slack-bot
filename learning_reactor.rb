require 'natto'

class LearningReactor
  REGEXP = /(?<words>.+)は(?<meaning>.+)/

  def initialize(knowledge)
    @knowledge = knowledge
  end

  def accept?(text, morphemes)
    # text.match?(REGEXP)
    morphemes.find{|n| n.surface == "は" && n.feature == "助詞"}
  end

  def react(text, morphemes)
    # match = REGEXP.match(text)
    # words = match[:words]
    # meaning = match[:meaning]
    index = morphemes.find_index{|n| n.surface == "は" && n.feature == "助詞"}
    words = morphemes[0...index].map(&:surface).join

    # 「〜〜はxx」のindex番目の「は」以降を取り出してる
    meaning = morphemes[index + 1..].map(&:surface).join
    @knowledge.learn(words, meaning)
    "`#{words}` を `#{meaning}` という意味で覚えたよ！"
  end
end