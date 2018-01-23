# Added method to Float class to format currency
class Float
  def to_currency
    format('%.2f', self)
  end
end

# Added method to Integer, in case the number is an Integer
# rather than float when to_currency is called
class Integer
  def to_currency
    to_f.to_currency
  end
end
