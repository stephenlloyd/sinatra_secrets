require 'yaml'
module Sinatra
  module Secrets

    def self.twilio_key
      file = YAML.load_file('./config/secrets.yml')
      p MyApp.settings.secrets_dir
      p file[ENV['RACK_ENV']][(__method__).to_s]
    end

    def self.method_missing method_name, *args, &block
      self.send(:define_method, method_name) {p "send"}
    end


  end

end

# class Dovile
#   def  coffee
#     p "I love coffee"
#   end

#   private

#   def dogs
#     p "I fucking hate dogs"
#   end
# end

# p dovile = Dovile.new
# dovile.class.send(:define_method, :cats){p "I love cats more than anything"}
# dovile.cats
