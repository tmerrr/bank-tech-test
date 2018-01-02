class Float
  def to_currency
    '%.2f' % self
  end
end

class Integer
  def to_currency
    self.to_f.to_currency
  end
end
