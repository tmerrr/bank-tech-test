class Balance
  attr_reader :total

  def initialize(total = 0)
    @total = total
  end

  def add(value)
    @total += value
  end
end
