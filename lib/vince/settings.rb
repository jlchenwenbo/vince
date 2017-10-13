require 'yaml'
require 'byebug'

module Vince

  class Settings

    def initialize(project_root='.', check_vince_project=true)
      @project_root = project_root
      @check_vince_project = check_vince_project
    end

    def data

      return @setting.yaml if @setting.yaml

      if @check_vince_project && !File.exist?(project_settings_path)
        puts "ERROR: No settings file at #{project_settings_path}. Are you sure you are in a project with vince setup?"
        puts "Please create a settings file via: vince init"
        exit 1
      end

      project = File.exist?(project_settings_path) ? YAML.load_file(project_settings_path) : {}
      user_file = "#{ENV['HOME']}/.vince/settings.yml"

      default_file = File.expand_path("../default/settings.yml", __FILE__)
      default = YAML.load_file(default_file)

      @settings_yaml = default.merge(user.merge(project))

    end

    private def project_setting_path
      "#{@project_root}/vince/settings.yml"
    end

  end

end