# require 'spec_helper'
require 'uia'

'
locator type:
[:title, :handle, :id, :name, :value, :control_type, :pattern, :scope]

text_field.send_keys [\'this\', :enter, \'is\', :enter, \'multiple\', :enter, \'lines\']
'

def wait_until(timeout=10, &block)
  start = Time.now
  until (result = block.call) || (Time.now - start > timeout)
    sleep 0.25
  end

  raise 'Timed out' unless result
  result
end


# procura a janela principal.
main_window = wait_until{ Uia.find_element title: /HP.*/ }

# procura todos os elementos tipo edit e name vazio, sao dois campos o user e password.
# text_elem = main_window.find_all(name: '', control_type: :edit)

# procura todos os elementos pelo value.
# text_elem = main_window.find_all(pattern: :value)

text_elem = main_window.find_all(pattern: :value)

puts text_elem.methods

# login.send_keys "john"
# pass.send_keys "HP"

text_elem.each do |text|
  # decobrir o id do elemento.
  puts text.id
end


# procura todos os elementos tipo button.
all = main_window.find_all(control_type: :button)

all.each do |button|
  #puts button.name
  # if button.name.include? "OK"
  #   button.click
  # end

  if button.name =~ /OK/i
    puts "Encontrado!"
    button.click
  end

end

