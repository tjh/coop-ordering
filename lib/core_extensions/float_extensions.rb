# -------------------------------------------------------------------------
#
#  To allow use of #number_to_currency in the
#  model...monkey-patch the float class to
#  include this ActionView method
#
#  Important for building a formatted #text
#  string for a coverage template with
#  values filled in
#
#  http://railsnotes.com/110-number-to-currency-inside-models/
#
# -------------------------------------------------------------------------

class Float
  include ToCurrency
end