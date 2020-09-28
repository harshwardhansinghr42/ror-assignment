class User
  STATUSES = ["active", "inactive", "pending"]
  attr_accessor :status

  STATUSES.each do |status|
    define_method("#{status}?") do
      self.status == status
    end
  end
end

user = User.new
user.status = "inactive"

p user.inactive?
