$LOAD_PATH.unshift(File.expand_path('../', __FILE__))
require 'vince/command'

module Vince
  class CLI < Command
    class Help

      def self.init
<<-EOL
Examples:

$ vince init --app=hi --image=tongueroo/hi

The image should not include the tag since the tag is generated
EOL

      end

      def self.docker
<<-EOL
Examples:

$ vince docker build

$ vince docker tag
EOL
      end


      def self.tasks
<<-EOL
Examples:

$ vince tasks build

Builds all the task defintiions.

Note all the existing vince/output generated task defintions are wiped out.
EOL
    end

      def self.ship
<<-EOL
Examples:

To build the docker image, generate the task definition and ship it, run:

$ vince ship hi-web-prod

By convention the task and service names match. If you need override to this convention then you can specific the task.  For example if you want to ship to the `hi-web-prod-1` service and use the `hi-web-prod` task, run:

$ vince ship hi-web-prod-1 --task hi-web-prod

The deploy will also created the ECS service if the service does not yet exist on the cluster.  The deploy will prompt you for the ELB `--target-group` if you are shipping a web container that does not yet exist.  If it is not a web container the `--target-group` option gets ignored.

The prommpt can be bypassed by specifying a valid `--target-group` option or specifying the `---no-target-group-prompt` option.

$ vince ship hi-web-prod --target-group arn:aws:elasticloadbalancing:us-east-1:123456789:targetgroup/hi-web-prod/jsdlfjsdkd

$ vince ship hi-web-prod --no-target-group-prompt
EOL
      end

      def ships
<<-EOL
Builds docker image, registers it and ships it to multiple services.  This deploys the same docker image to multiple ECS services.

Examples:

$ vince ships hi-web-prod hi-clock-prod hi-worker-prod

By convention the task definition and service names match for each of the services you ship. If you need to override to this convention then you can specify the task definition for each service with a special syntax.  In the special syntax the service and task definition is separated by a colon.  Example:

$ vince ships hi-web-prod-1:hi-web-prod hi-clock-prod-1 hi-worker-prod-1

Here vince will deploy to the hi-web-prod-1 ECS Service using the hi-web-prod task definition, but use the convention for the rest of the service.

For each service being deployed to, vince will create the ECS service if the service does not yet exist on the cluster.  The deploy process will prompt you for the ELB `--target-group` if you are deploying to a 'web' service that does not yet exist.  Vince determines that it is a web service by the name of the service. If the service has 'web' in the name then it is considered a web service. If it is not a web service then the `--target-group` option gets ignored.

The prommpt can be bypassed by specifying a valid `--target-group` option or specifying the `---no-target-group-prompt` option.  Examples:

$ vince ships hi-web-prod hi-clock-prod hi-worker-prod --target-group arn:aws:elasticloadbalancing:us-east-1:123456789:targetgroup/hi-web-prod/jsdlfjsdkd

$ vince ships hi-web-prod hi-clock-prod hi-worker-prod --no-target-group-prompt
EOL
      end

      def task
<<-EOL
Examples:

To run a one time task with ECS:

$ vince task hi-migrate-prod

You can also override the command used by the Docker container in the task definitions via command.

vince task hi-web-prod --command bin/migrate

vince task hi-web-prod --command bin/with_env bundle exec rake db:migrate:redo VERSION=xxx
EOL
      end

      def destroy
<<-EOL
Examples:

Destroys the service.  It will automatcally set the desired task size to 0 and stop all task so the destory happens in one command.

$ vince destroy hi-web-prod
EOL
      end

      def scale
<<-EOL
Examples:

Scales the service.  Simple wrapper for `aws ecs update-service --service xxx ----desired-count xxx`

$ vince scale hi-web-prod 5
EOL
      end
    end
  end
end