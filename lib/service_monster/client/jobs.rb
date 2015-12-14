module ServiceMonster
  class Client
    module Jobs

      def jobs(options = {})
        response = get("jobs", options)
      end

    end
  end
end
