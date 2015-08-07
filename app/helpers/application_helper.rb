module ApplicationHelper
  def quid(num)
    if num.present?
      precision = (num.floor == num) ? 0 : 2
      number_to_currency num, unit: "£", precision: precision
    else
      ""
    end
  end
end
