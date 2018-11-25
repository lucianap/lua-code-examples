local Account = require "object-account"

-- Simple instancia de Account
SpecialAccount = Account:new()

-- Notar que por como estaba definido Account, ahora self apunta a la metatabla SpecialAccount.
s = SpecialAccount:new{limit=1000.00}

print(s.balance)

-- redefinimos un metodo
function SpecialAccount:withdraw (v)
	if v - self.balance >= self:getLimit() then
		-- error "Fondos insuficientes"
	end
	self.balance = self.balance - v
end

-- agregamos un metodo
function SpecialAccount:getLimit ()
	return self.limit or 0
end

print(s:getLimit())
s:withdraw(100)
print(s.balance)
s:withdraw(19999)
