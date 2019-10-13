require_relative 'knowledge.rb'
require_relative 'learning_reactor.rb'
require_relative 'what_is_reactor.rb'

class Kuronekosan
  REACTOR_CLASSES = [LearningReactor, WhatIsReactor]

  def initialize
    @knowledge = Knowledge.new
    @reactors = REACTOR_CLASSES.map do |rc|
      rc.new(@knowledge)
    end
  end

  def react(text)
    reactor = @reactors.find{|reactor| reactor.accept?(text) }
    if reactor&.accept?(text)
      reactor.react(text)
    else
      "お主は何を言っている？"
    end
  end
end