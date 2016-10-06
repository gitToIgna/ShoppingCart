# Shopping Cart

# Creamos la clase principal (Inheritance/Herencia) con la variable de lista vacía de Items
class ShoppingCart
	def initialize
		@items = []
	end
# Iteration 2: para añadir los Items que creamos a nuestro Shopping Cart
	def add_item(item)
		@items.push(item)
	end

# Iteration 3: creamos el método checkout para sumar el precio de los pedidos
	def checkout
		total = @items.reduce(0) do |sum, item|
		sum + item.price
	end 

# Iteration 4: si le personal compra más de 5 productos, le hacemos un 10% de descuento
		if @items.size > 5
			total * 0.9
			else
				total
			end
		end
	end

# Creamos la clase Items donde iremos poniendo todos los Items. Tiene 2 atributos: name and price
class Item
	attr_accessor(:price)

	def initialize(name, price)
		@name = name
		@price = price
	end
end

# El Item Fruit tiene un 10% si compras el sábado o el domingo
class Fruit < Item
	def price
		now = Time.now

		if now.saturday? || now.sunday?
			return @price * 0.9
		else
			return @price
		end
	end
end

# El Item Houseware tiene un 5% si compras por valor > 100
class Houseware < Item
	def price
		if @price > 100
			return @price * 0.95
		else
			return @price
		end
	end
end

# Iteration 1: cremos una serie de Items indicando su name, price y metiéndolo en su "familia" Item que le corresponde
banana = Fruit.new("Banana", 10)
orange_juice = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
vacuum_cleaner = Houseware.new("Vacuum Cleaner", 150)
anchovies = Item.new("Anchovies", 2)

# Iteration 3: hacemos el pedido de igna, creándolo primero
igna_cart = ShoppingCart.new
igna_cart.add_item(orange_juice)
igna_cart.add_item(rice)
igna_cart.checkout

puts "Tu importe total de hoy es #{igna_cart.checkout}€. ¡Qué tengas un buen día!"