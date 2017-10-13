module Vince
  class Docker < Command
    autoload :Help, 'ufo/docker/help'
    autoload :Builder, 'ufo/docker/builder'
    autoload :Dockerfile, 'ufo/docker/dockerfile'
    autoload :Cleaner, 'ufo/docker/cleaner'

    desc "build", "builds docker image"
    long_desc Help.build
    option :push, type: :boolean, default: false
    def build
      builder = Docker

    end





  end
end