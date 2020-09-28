# Example 1:

# Initial code
# def get_addresses
#   addresses = []
#   users = User.all
#   users.each do |user|
#     addresses << user.address if user.address.city.present?
#   end
#   addresses
# end

# Refactored code
def get_addresses
  User.includes(:address)
      .where.not(addresses: {city: [nil, ""]})
      .map { |user| user.address }
end


#####################################################################################################
# Example 2:
# Initial code
# class Greeting
#  def name=(value)
#  @name = value
#  end

#  def name
#  @name
#  end
# end

# Refactored code
class Greeting
  attr_accessor :name
end


########################################################################################################
# Example 3:
# Initial code
# def sum(a, b)
#  a + b
# end

# def sum(p, q, r)
#  p + q + r
# end

# def sum(x, y, z, w)
#  x + y + z + w
# end

# sum(2, 3) #=> 5
# sum(1,2,3,4) # => 10

# Refactored code
def sum(args_arr)
 args_arr.inject(:+)
end

sum([2, 3]) #=> 5
sum([1,2,3,4]) # => 10
