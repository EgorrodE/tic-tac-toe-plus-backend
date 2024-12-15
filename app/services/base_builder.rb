class BaseBuilder
  def self.call(params)
    new(params).call
  end

  def call
    raise NotImplementedError
  end

  private

  def initialize(params)
    @params = params
  end

  def params
    @params
  end
end