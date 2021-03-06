class ErrorSerializer
  def self.call(errors)
    { 'status': 400,
      'errors': errors.full_messages }
  end

  def self.invalid_password
    { 'status': 400,
      'errors': 'Password is incorrect.' }
  end

  def self.invalid_email
    { 'status': 400,
      'errors': 'Email is incorrect.' }
  end

  def self.invalid_key
    { 'status': 401,
      'errors': 'API key is invalid.' }
  end

  def self.no_results
    {
      'status': 200,
      'data':
      {
        'results': []
      }
    }
  end
end
