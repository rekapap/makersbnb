class FakeClient

  cattr_accessor :sms
  self.sms = []

  def initialize(_account_sid, _auth_token)
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.sms << FakeMessage.new(from: from, to: to, body: body)
    self
  end

  def sid
  end
end

class FakeMessage
  attr_reader :from, :to, :body
  def initialize(from:, to:, body:)
    @from = from
    @to = to
    @body = body
  end
end
