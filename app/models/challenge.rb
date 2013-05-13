class Challenge 
  include Virtus
  
  attribute :title, String
  attribute :content, String
  attribute :current, Boolean

  def self.default
    content = <<-END
      However, let's make our goal to get as close to English looking sentences as possible. One way you might do this is using a technique called Markov Chains.

      To use Markov Chains, you read some text document(s), making note of which characters commonly follow which characters or which words commonly follow other words (it works for either scale). Then, when generating text, you just select a character or word to output, based on the characters or words that came before it.

The number of previous characters or words considered is called the "order" and you can adjust that to try and find a natural feel. For example, here is some generated text using a second order word chain derived from the Sherlock Holmes novel "The Hound of the Baskervilles" by Arthur Conan Doyle
    END

    new(title: 'Markov Chains', content: content)
  end
end
