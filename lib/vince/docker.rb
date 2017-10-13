module Vince
  class Docker < Command
    autoload :Help, 'vince/docker/help'
    autoload :Builder, 'vince/docker/builder'
    autoload :Dockerfile, 'vince/docker/dockerfile'
    autoload :Cleaner, 'vince/docker/cleaner'

    desc "build", "builds docker image"
    long_desc Help.build
    option :push, type: :boolean, default: false
    def build
      builder = Docker

    end





  end
end