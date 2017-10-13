module Vince

  class Docker::Builder
    include Util

    def initialize(options={})
      @options = options
      @project_root = options[:project_root] || '.'
      @dockerfile = options[:dockerfile] || 'Dockerfile'
      @image_namespace = options[:@image_namespace] || 'ufo'
    end

    def self.build(options)
      builder = Docker::Builder.new(options)
      if options[:docker]
        builder.build
        builder.push
      end
      builder
    end







  end



end