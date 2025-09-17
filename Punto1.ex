defmodule Empresa do
  def main do
    peso = "Ingrese el peso (kg): "
    |> ingresar_peso()
    tipo_cliente="Ingrese el tipo de cliente 1=corporativo 2=estudiante 3=regular: "
    |> ingresar_tipo_cliente()
    tipo_servicio="Ingrese el tipo de servicio 1=express 2=estandar: "
    |>ingresar_tipo_servicio

    tarifa_base=determinar_tarifa(peso)
    descuento=calcular_descuento(tarifa_base,tipo_cliente)
    recargo=calcular_recargo(tarifa_base,tipo_servicio)

    total=calcular_total(tarifa_base,descuento,recargo)
    mensaje=generar_mensaje(tarifa_base,descuento,recargo,total)

    mostrar_mensaje(mensaje)

  end

  def ingresar_peso(mensaje) do
    IO.gets(mensaje)
      |> String.trim()
      |> String.to_integer()
  end

  def ingresar_tipo_cliente(mensaje) do
    seleccion= IO.gets(mensaje)  |> String.trim()
    case seleccion do
      "1" -> :corporativo
      "2" -> :estudiante
      "3" -> :regular
      _ -> ingresar_tipo_cliente("Ingrese un tipo valido")
    end
  end

  def ingresar_tipo_servicio(mensaje) do
    seleccion= IO.gets(mensaje) |> String.trim()
    case seleccion do
      "1" -> :express
      "2" -> :estandar
      _ -> ingresar_tipo_servicio("Ingrese un tipo valido")
    end

  end

  def determinar_tarifa(peso) when peso <= 0 do
    "Ingrese un peso valido: "
    |> ingresar_peso()
  end

  def determinar_tarifa(peso) do
    cond do
      peso <=1 -> 8000
      peso <=5 -> 12000
      peso > 5 -> 20000

    end

  end

  def calcular_descuento(tarifa_base, tipo_cliente) do
    case tipo_cliente do
      :corporativo -> tarifa_base*(15/100)
      :estudiante -> tarifa_base*(10/100)
      :regular -> tarifa_base*0
    end
  end

  def calcular_recargo(tarifa_base, tipo_servicio) do
    case tipo_servicio do
      :express -> tarifa_base*(25/100)
      :estandar -> tarifa_base*0
    end
  end

  def calcular_total(tarifa_base,descuento,recargo) do
    tarifa_base - descuento + recargo
  end

  def generar_mensaje(tarifa_base,descuento,recargo,total) do
    total_descuento=descuento
    total_recargo=recargo

    mensaje="La tarifa base: #{tarifa_base} \n
    El descuento: #{:erlang.float_to_binary(total_descuento*1.0, decimals: 1)} \n
    El recargo: #{:erlang.float_to_binary(total_recargo*1.0, decimals: 1)} \n
    En total es: #{:erlang.float_to_binary(total*1.0, decimals: 1)}"
    mensaje
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end
Empresa.main()
