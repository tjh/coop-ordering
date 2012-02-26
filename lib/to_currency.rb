module ToCurrency
  require 'rubygems'
  require 'action_view'

  def to_currency(options = {})
    ActionView::Base.new.number_to_currency(self, options)
  end
end