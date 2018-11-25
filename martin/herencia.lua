require "account"

SpecialAccount = Account:new(0)

function SpecialAccount.deposit(self, amount)
  self.balance = self.balance + 1.2 * amount
end

SpecialAccount.__tostring = Account.__tostring


s = SpecialAccount:new(0)
print(s)
s:deposit(100)
print(s)
