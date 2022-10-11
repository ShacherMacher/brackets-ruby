BRACKETS = { '(' => ')',
             '{' => '}',
             '[' => ']'
}

OP_BRACKETS = BRACKETS.keys
CL_BRACKETS = BRACKETS.values

def balanced?(input)
  stack = []
  input.each_char do |symbol|
    if CL_BRACKETS.include?(symbol)
      if symbol != BRACKETS[stack.last]
        return false
      else
        stack.pop
      end
    elsif OP_BRACKETS.include?(symbol)
      stack.push(symbol)
    end
  end
  stack.empty?
end

def bracket_valid?(symbol)
   (OP_BRACKETS.include? symbol) || (CL_BRACKETS.include? symbol)
end

string = ""
exit_string = "exit"
while true
  puts "Enter:"
  user_input = STDIN.gets.chomp
  if exit_string.eql?(user_input)
    break
  end
  if bracket_valid?(user_input)
    result = balanced?(string.concat(user_input))
    puts result ? "valid" : "invalid"
  else
    puts "Unknown symbol"
    puts "Type 'exit' and press Enter to exit"
  end
  puts "Current string: " + string
end