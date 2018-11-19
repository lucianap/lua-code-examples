Account = {}

function Account.new(self, initial_balance)
  account = {balance = initial_balance}
  setmetatable(account, self)
  self.__index = self
  return account
end

function Account.deposit(self, amount)
  self.balance = self.balance + amount
end

function Account.withdraw(self, amount)
  self.balance = self.balance - amount
end

function Account.__tostring(self)
  return "Saldo = " .. self.balance
end

a = Account:new(100)
--print("a: ", a)

b = Account:new(50)
--print("b: ", b)
--print("a(despues): ", a)

a:deposit(50)
--print(a)
a:withdraw(50)
--print(a)
