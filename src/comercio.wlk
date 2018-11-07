import remeras.*

class Comercio{
	const property sucursales = #{}
	const property pedidos = #{}
	
	method registrarPedido(pedido){
		pedidos.add(pedido)
	}
	
	method totalFacturado() =  
		pedidos.sum{pedido=> pedido.precio()}
	
	method totalFacturado(sucursal) = 
		pedidos.filter{pedido => pedido.sucursal() == sucursal}
			.sum{pedido => pedido.precio()}
	
	method cantPedidosDe(unColor) = 
		pedidos.filter{pedido => pedido.modeloRemera().color() == unColor}.size()
	
	method pedidoMasCaro() = 
		pedidos.max{pedido => pedido.precio()}
		
	method laSucursalQMasFacturo() = sucursales.max{sucursal=> self.totalFacturado(sucursal)}
	
//	method deQueTallesNoHayPedidos(){
//		var rangoTalles = new Range(32,48)
//		return pedidos.
//	}
	
}
class Sucursal{
	var property cantMinima
}

class Pedido{
	
	const property modeloRemera 
	const property cantidad 
	const property sucursal
	
	method precioBase() = modeloRemera.costo() * cantidad
	
	method precio() = 
		if(cantidad > sucursal.cantMinima())
			self.precioBase() * modeloRemera.porcentaje() // porcentaje a restar
		else
			self.precioBase()		
	
}