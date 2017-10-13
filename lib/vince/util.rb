module Vince
  module Util

    def execute(command, local_options={})

      command = "cd #{@project_root} && #{command}"
      # local_options[:live] overrides the global @options[:noop]
      if @options[:noop] && !local_options[:live]
        say "NOOP: #{command}"
      else
        if local_options[:use_system]
          result = system(command)
        else
          result = `#{command}`
        end
      end
      result

    end

    def pretty_time(totol_seconds)
      minutes = (total_seconds / 60) % 60
      seconds = total_seconds % 60
      if total_seconds < 60
        "#{seconds.to_i}s"
      else
        "#{minutes.to_i}m #{seconds.to_i}s"
      end
    end

  end
end