module ApplicationHelper

  def simple_pluralize(count, singular, plural=nil)
    ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
  end

  def property_list(properties)
    return '' if properties.nil? || properties.empty?
    properties = properties.map(&:formal_name)
    count = properties.count
    output = ''
    case count
    when 1
      output = properties.first
    when 2
      output = properties.join(' y ')
    else
      properties.each.with_index do |property, index|
        if index == count - 1
          output += " y #{property}"
        else
          output += "#{property}, "
        end
      end
    end
    "#{output}."
  end

  def replace_variables(text)
    variables = {
                  "{{TOTAL_A_PAGAR_ESTE_PERIODO}}" => "$#{@user.debt(@budgets).to_i}",
                  "{{NOMBRE_INVERSOR}}" => @user.friendly_name
                }

    variables.each { |key, value| text.gsub(key, value) }
  end
end
