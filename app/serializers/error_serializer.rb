class ErrorSerializer
  def self.call(errors)
    { "status": 400,
      "errors": errors.full_messages }
  end

  def self.invalid_credentials
    { "status": 400,
      "errors": "Invalid credentials" }
  end
end
