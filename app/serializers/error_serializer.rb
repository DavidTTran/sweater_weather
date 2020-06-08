class ErrorSerializer
  def self.call(errors)
    { "status": 400,
      "errors": errors.full_messages }
  end
end
