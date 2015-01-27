module ServiceMonster
  # Wrapper for the ServiceMonster REST API.
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
    
    include ServiceMonster::Client::Accounts
    include ServiceMonster::Client::Orders
  end
end