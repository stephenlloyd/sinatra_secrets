require 'yaml'
module Sinatra


  module Secrets

    def self.registered(klass)
      @klass = klass
    end

    def self.twilio_key
      root = @klass.settings.secrets_dir || "./config"

      file = YAML.load_file(root + '/secrets.yml')
      file[ENV['RACK_ENV']][(__method__).to_s]
    end

    def self.method_missing method_name, *args, &block

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
