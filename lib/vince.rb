$LOAD_PATH.unshift(File.expand_path('../', __FILE__))
require 'vince/version'

module Vince

  autoload :Env, 'vince/env'
  autoload :Defaults, 'vince/defaults'
  autoload :AwsServices, 'vince/aws_services'
  autoload :Command, 'vince/command'
  autoload :Settings, 'vince/settings'
  autoload :Util, 'vince/util'
  autoload :Init, 'vince/init'
  autoload :CLI, 'vince/cli'
  autoload :Ship, 'vince/ship'
  autoload :Task, 'vince/task'
  autoload :Destroy, 'vince/destroy'
  autoload :DSL, 'vince/dsl'
  autoload :Scale, 'vince/scale'
  autoload :LogGroup, 'vince/log_group'
  autoload :Docker, 'vince/docker'
  autoload :Ecr, 'vince/ecr'
  autoload :Task, 'vince/tasks'

end