module ApplicationHelper
  def currency(num, unit)
    if num.present?
      precision = (num.floor == num) ? 0 : 2
      number_to_currency num, unit: unit, precision: precision
    else
      ""
    end
  end
end
