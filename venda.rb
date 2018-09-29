class Produto
#private
	attr_accessor :id
	attr_accessor :name
	attr_accessor :desc

public
	def cadProduto(codigo, nome, descricao)
		self.id = codigo
		self.name = nome
		self.desc = descricao
	end
public
	def showProduto
		puts self.id
		puts self.name
		puts self.desc
	end
end

class Estoque
	attr_accessor :cod_prod
	attr_accessor :qnt

public
	def cadEstoque(codigo,quantidade)
		self.cod_prod = codigo
		self.qnt = quantidade
	end

public
	def saidaEstoque(quantidade)
		self.qnt -= quantidade		
	end
end

class Caixa
	attr_accessor :saldo

public
	def entradaCaixa(valor)
		self.saldo += valor
	end
end

class Venda
	attr_accessor :cod_prod
	attr_accessor :qnt
	attr_accessor :dinheiro
public
	def cadVenda(cod, quantidade, valor)
		self.cod_prod = cod
		self.qnt = quantidade
		self. dinheiro = valor
	end
public
	def aumentarSaldo(obj_caixa)
		obj_caixa.entradaCaixa(self.dinheiro)
	end
public
	def diminuirEstoque(obj_estoque)
		obj_estoque.saidaEstoque(self.qnt)
	end
end



produto = Produto.new
estoque = Estoque.new
caixa = Caixa.new
venda = Venda.new


produto.cadProduto(1,"Prego 1/4", "Sem descricao")
estoque.cadEstoque(1, 200)
caixa.saldo = 100
venda.cadVenda(1, 10, 0.50)

puts "----------------------------------"
puts "Estoque = #{estoque.qnt}" 

puts "----------------------------------"
puts "Saldo = #{caixa.saldo}"

venda.aumentarSaldo(caixa)
venda.diminuirEstoque(estoque)


puts "----------------------------------"
puts "Valor da venda: R$#{venda.dinheiro}" 

puts "----------------------------------"
puts "Quantidade do item da venda: #{venda.qnt}"

puts "----------------------------------"
puts "Saldo = #{caixa.saldo}"

puts "----------------------------------"
puts "Estoque = #{estoque.qnt}" 
