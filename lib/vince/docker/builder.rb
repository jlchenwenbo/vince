module Vince

  class Docker::Builder
    include Util

    def initialize(options={})
      @options = options
      @project_root = options[:project_root] || '.'
      @dockerfile = options[:dockerfile] || 'Dockerfile'
      @image_namespace = options[:@image_namespace] || 'vince'
    end

    def self.build(options)
      builder = Docker::Builder.new(options)
      if options[:docker]
        builder.build
        builder.push
      end
      builder
    end

    def build

      start_time = Time.now
      store_full_image_name






    end

    def store_full_image_name
      dirname = File.dirname(docker_name_path)
      FileUtils.mkdir_p(dirname) unless File.exist?(dirname)
      full_image_name = generate_name
      IO.write(doker_name_path, full_image_name)
      IO.write("#{@project_root}/vince/version", full_image_name)
    end

    def docker_name_path
      "#{@project_root}/vince/docker_image_name_#{@image_namespace}.txt"
    end

    def generate_name
      "#{image_name}:#{@image_namespace}-#{timestamp}-#{git_sha}"
    end

    def timestamp
      @timestamp ||= Time.now.strftime('%Y-%m-%dT%H-%M-%S')
    end

    def git_sha
      return @git_sha if @git_sha
      @git_sha = `cd #{@project_root} && git rev-parse --short HEAD`
      @git_sha.strip!
    end

    def update_auth_token
      return unless ecr_image?


    end




  end



end