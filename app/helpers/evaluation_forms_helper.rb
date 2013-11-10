module EvaluationFormsHelper
  def field_name(symbol)
    symbol.to_s.gsub(/_/, ' ').capitalize
  end

  def split_lines(text)
    text.to_s.gsub(/[^\r\n]+/) do |line|
      yield line
    end
  end
end