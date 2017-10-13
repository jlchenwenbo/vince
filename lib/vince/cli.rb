require 'thor'
require 'vince/command'
require 'vince/cli/help'

module Vince

  class CLI < Command

    class_option :verbose, type: :boolean
    class_option :mute, type: :boolean
    class_option :noop, type: :boolean
    class_option :project_root, type: :string, default: '.'
    class_option :cluster, desc: "Cluster. Overrides vince/settings.yml"

    desc "docker [ACTION]", "docker related tasks"
    long_desc Help.docker
    subcommand "docker", Docker

    desc "init", "setup initial vince files"
    option :image, type: :string, required: true, desc: "Docker image name without the tag. Example: tongueroo/hi. Configures vince/settings.yml"
    option :app, type: :string, required: true, desc: "App name. Preferably one word. Used in the generated vince/task_definitions.rb."
    def init

    end

  end

end