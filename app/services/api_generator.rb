class ApiGenerator
  require 'securerandom'

  def self.call
    SecureRandom.uuid
  end
end
