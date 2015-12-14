module ServiceMonster
  class Client
    module Reminders

      def reminders(options = {})
        response = get("reminders", options)
      end

    end
  end
end
