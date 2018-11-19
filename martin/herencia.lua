require "account"

SpecialAccount = Account:new(0)

--function SpecialAccount.__tostring(self)
--  return "Saldo especial = " .. self.balance
--end

SpecialAccount.__tostring = Account.__tostring

function SpecialAccount.deposit(self, amount)
  self.balance = self.balance + 1.2 * amount
end

s = SpecialAccount:new(0)
print(s)
s:deposit(100)
print(s)
