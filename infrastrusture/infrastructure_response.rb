module Infrastructure

  require 'json'

  @@SUCCESS_OK = 200
  @@SUCCESS_CREATED = 201

  @@ERROR_BAD_REQUEST = 400
  @@ERROR_UNAUTHORIZED = 401
  @@ERROR_FORBIDDEN = 403
  @@ERROR_NOT_FOUND = 404

  @@ERROR_INTERNAL_SERVER_ERROR = 500
  @@ERROR_NOT_IMPLEMENTED = 501


  class ResponseResult
    attr_accessor :succeed, :result, :code, :message

    def initialize(succeed, result, code, message)
      @succeed = succeed
      @result = result
      @code = code
      @message = message
    end

    def as_json(options = {})
      {
          succeed: @succeed,
          result: @result,
          code: @code,
          message: @message
      }
    end

    def to_json(*options)
      as_json(options).to_json(options)
    end

  end

  class OkResponseResult < ResponseResult
    def initialize(result)
      super(true,result,200,"")
    end
  end


  class FailerResponseResult < ResponseResult
    def initialize(code,message)
      super(false,nil,code,message)
    end
  end

end

