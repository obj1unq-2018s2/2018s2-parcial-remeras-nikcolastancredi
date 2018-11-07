


class RemeraLisa{
	const talle
	const property color 
	
	method costo() = valoresBase.varloPorTalle(talle) *
		valoresBase.porcentajePor(color)
		
	method porcentaje() = 0.9
}

class RemeraBordada inherits RemeraLisa{
	const cantidadHilos
	var minimo = 20 // este valor en otro modelado puede cambiar
	
	method costoBordado() = cantidadHilos * 10
	
	override method costo() = super() +  self.costoBordado().max(minimo)
	
	override method porcentaje() = 0.98

}

class RemeraSublimadas inherits RemeraLisa{
	const dibujo // se asigna un objeto dibujo
	
	method costoSublimado() = dibujo.superficie() * 0.50
	
	override method costo() =
		 super() + self.costoSublimado() + dibujo.empresa().derechoAutor()
	
	override method porcentaje() = if(dibujo.empresa().tieneConvenio()) 0.8 else super()
}

class Dibujo{
	const ancho
	const alto
	const property empresa = sinEmpresa //  todo  dibujo no tiene empresa a no ser que se defina
	
	method superficie() = ancho * alto
	
	method costoDerechoAutor() =  empresa.costo()
}

object sinEmpresa{
	const property derechoAutor = 0
	const property tieneConvenio = false
}

class Empresa{
	const property derechoAutor
	var property tieneConvenio
}

object valoresBase{
	var valorRegular = 80  // Pueden cambiar
	var valorAlto = 100   // Pueden cambiar 
	const coloresBasicos = ["Blanco","Negro","Gris"]
	
	method varloPorTalle(unTalle) = if(unTalle.between(32,41)) valorRegular else valorAlto 
	
	method porcentajePor(unColor) =  if(coloresBasicos.contains(unColor)) 1 else 1.1 
}