class NotFoundError < HttpError
  def initialize
    super(nil,nil)
  end
  def formatted_error
    'No results were find for your search'
  end

  def http_code
    404
  end
end