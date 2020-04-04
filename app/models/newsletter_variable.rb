# If we want to add a new variable, there are two places that we need to change:
#  1. NewsletterVariable class - Add new variable to the LIST constant.
#  2. app/helpers/application_helper - Add new variable and the value to replace.

class NewsletterVariable
  LIST = [
    ['Total a Pagar', '{{TOTAL_A_PAGAR}}'],
    ['Nombre del Inversor', '{{NOMBRE_INVERSOR}}']
  ]

  def self.list
    LIST
  end
end