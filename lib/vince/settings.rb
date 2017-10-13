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

      debugger

      if @check_ufo_project && !File.exist?(project_settings_path)
        puts "ERROR: No settings file at #{project_settings_path}. Are you sure you are in a project with vince setup?"
        puts "Please create a settings file via: ufo init"
        exit 1
      end

      project = File.exist?(project_settings_path) ? YAML.load_file(project_settings_path) : {}



    end


  end

end