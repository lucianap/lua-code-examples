Account = {}
Account.__index = Account

function Account:new ()
	o = {balance = 100} 	-- crea una tabla si el usuario no provee una
	setmetatable(o, self)
	self.__index = self
	return o
end

function Account.withdraw(self, amount)
	self.balance = self.balance - amount
end

-- Sytnactic sugar, los : te ahorran poner el self.
function Account:deposit(amount)
   self.balance = self.balance + amount
end

 ta = Account.new(Account)
 ta:deposit(200)
 ta.withdraw(ta, 100)

return Account