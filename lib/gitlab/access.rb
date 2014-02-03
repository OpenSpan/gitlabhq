# Gitlab::Access module
#
# Define allowed roles that can be used
# in GitLab code to determine authorization level
#
module Gitlab
  module Access
    GUEST     = 10
    REPORTER  = 20
    DEVELOPER = 30
    ACCEPTOR  = 35
    MASTER    = 40
    OWNER     = 50

    class << self
      def values
        options.values
      end

      def options
        {
          "Guest"     => GUEST,
          "Reporter"  => REPORTER,
          "Developer" => DEVELOPER,
          "Acceptor"  => ACCEPTOR,
          "Master"    => MASTER,
        }
      end

      def options_with_owner
        options.merge(
          "Owner" => OWNER
        )
      end

      def sym_options
        {
          guest:     GUEST,
          reporter:  REPORTER,
          developer: DEVELOPER,
          acceptor:  ACCEPTOR,
          master:    MASTER,
        }
      end
    end

    def human_access
      Gitlab::Access.options_with_owner.key(access_field)
    end

    def owner?
      access_field == OWNER
    end
  end
end
