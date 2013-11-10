module EvaluationFormsHelper
  def field_name(symbol)
    symbol.to_s.sub(/_/, ' ').capitalize
  end
end