require_relative 'knowledge.rb'
require_relative 'learning_reactor.rb'
require_relative 'what_is_reactor.rb'
require 'natto'
# https://github.com/buruzaemon/natto/wiki

class Kuronekosan
  REACTOR_CLASSES = [LearningReactor, WhatIsReactor]

  def initialize
    @knowledge = Knowledge.new
    # フォーマット指定。%f[0]で.featureに品詞が取り出せる %f[0]の数字は% mecabで解析したときのx番目の情報を指している？
    # https://github.com/buruzaemon/natto/wiki/%E5%87%BA%E5%8A%9B%E3%83%95%E3%82%A9%E3%83%BC%E3%83%9E%E3%83%83%E3%83%88%E3%81%AE%E6%8C%87%E5%AE%9A
    @nm = Natto::MeCab.new('-F%f[0]')
    @reactors = REACTOR_CLASSES.map do |rc|
      rc.new(@knowledge)
    end
  end

  def react(text)
    # compactでnilを取り除いた配列を返す
    morphemes = @nm.enum_parse(text).map {|n| n unless n.is_eos?}.compact
    reactor = @reactors.find{|reactor| reactor.accept?(text, morphemes) }
    if reactor&.accept?(text, morphemes)
      reactor.react(text, morphemes)
    else
      "お主は何を言っている？"
    end
  end
end