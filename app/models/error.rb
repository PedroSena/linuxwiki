class Error

  attr_accessor :http_code

  def initialize(http_code, model)
    @http_code = http_code
    @model = model
  end

  def formatted_error
    @model.errors.full_messages.join("\n")
  end

end