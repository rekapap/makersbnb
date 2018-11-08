class FakeClient
  def initialize(sid, token)
  end

  def messages
    FakeMessages.new
  end

end

class FakeMessages
  Message = Struct.new(:from, :to, :body)

  cattr_accessor :messages
  self.messages = []
  
  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.messages << Message.new(from: from, to: to, body: body)
  end
end

class FakeMessage
  attr_reader :body
  def initialize(body)
    @body = body
  end

  def sid
  end
end

