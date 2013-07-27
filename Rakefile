#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Codearena::Application.load_tasks

namespace :db do
  desc "seed db data"
  task :seed => :environment do
    content = <<-END
    However, let's make our goal to get as close to English looking sentences as possible. One way you might do this is using a technique called Markov Chains.

    To use Markov Chains, you read some text document(s), making note of which characters commonly follow which characters or which words commonly follow other words (it works for either scale). Then, when generating text, you just select a character or word to output, based on the characters or words that came before it.

    The number of previous characters or words considered is called the "order" and you can adjust that to try and find a natural feel. For example, here is some generated text using a second order word chain derived from the Sherlock Holmes novel "The Hound of the Baskervilles" by Arthur Conan Doyle
    END

    current = Challenge.new(title: 'Markov Chains', content: content, current: true)
    Challenges.new.add(current)
  end
end

task :default => ['spec', 'jasmine:headless', 'cucumber'] 
