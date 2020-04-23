# If we want to add a new variable, there are two places that we need to change:
#  1. NewsletterVariable class - Add new variable to the LIST constant.
#  2. app/helpers/application_helper - Add new variable and the value to replace.

class NewsletterVariable
  LIST = [
    ['Total a Pagar', '{{TOTAL_A_PAGAR}}'],
    ['Nombre del Inversor', '{{NOMBRE_INVERSOR}}']
  ]

  def initialize(user, newsletter)
    @user = user
    @newsletter = newsletter
  end

  def variables_to_replace
    current_budget = Budget.last
    {
      "{{NOMBRE_INVERSOR}}" => @user.first_name,
      "{{TOTAL_A_PAGAR}}" => @user.debt([current_budget])
      #"{{CAC_ACTUAL}}" => current_budget.current_cac
      #"{{TOTAL_ADEUDADO}}" => @user.debt
    }
  end

  def self.list
    LIST
  end
end