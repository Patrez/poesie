require 'poesie/log'
require 'poesie/exporter'
require 'poesie/filters'
require 'poesie/android_formatter'
require 'poesie/apple_formatter'
require 'poesie/context_formatter'

require 'json'

module Poesie
  def self.exit_with_error(message)
    Log::error message
    exit 1
  end

  # Apply the list of text substitutions to the given string
  #
  # @param [String] text
  #        The text to process
  # @param [Hash<String,String>] substitutions
  #        The substitutions to apply
  #
  def self.process(text, substitutions)
    return text if substitutions.nil?
    replaced = text.dup
    list = substitutions
    list = [substitutions] if substitutions.is_a?(Hash)
    list.each do |hash|
      hash.each do |k,v|
        # If the key is surrounding by slashes, interpret as a RegExp
        k = Regexp.new($1) if k =~ %r(^/(.*)/$)
        replaced.gsub!(k, v)
      end
    end
    replaced
  end
end
