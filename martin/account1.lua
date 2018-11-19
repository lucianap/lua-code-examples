Account = {}

function Account.new(self, initial_balance)
  self.balance = initial_balance
  return self
end

function Account.deposit(self, amount)
  self.balance = self.balance + amount
end

function Account.withdraw(self, amount)
  self.balance = self.balance - amount
end

a = Account:new(100) --Account.new(Account, 100)
print("Saldo de a: " .. a.balance)

--[[
b = Account:new(50)
print("Saldo de b: " .. b.balance)
print("Saldo de a (despues): " .. a.balance)
--]]
