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

# Added the same method to NilClass so the method can be called,
# but does nothing
class NilClass
  def to_currency; end
end
