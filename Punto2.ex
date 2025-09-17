defmodule Cine do
  def main do
    cine= %{
      1 =>  20,
      2 =>  30,
      3 =>  40,
      4 =>  50,
      5 =>  60,
      6 =>  70,
    }

    sala="Ingrese la sala en la cual se reservaran las sillas: "
          |>ingresar()
          |>String.to_integer()
    sillas= "Ingrese sillas a reservar: "
          |>ingresar()
          |>String.to_integer()
    reservar_sillas(cine,sala,sillas)
  end

  def ingresar(mensaje) do
    IO.gets(mensaje)
    |>String.trim()
  end

  def reservar_sillas(cine,sala,sillas) do

    cond do
      !existe_sala?(cine,sala) -> IO.puts("Sala no encontrada")
      !hay_sillas?(cine,sala,sillas) -> IO.puts("No hay suficientes sillas disponibles")
      restar_sillas(cine,sala,sillas) -> IO.inspect(cine)
    end
  end

  def existe_sala?(cine,sala) do
    Map.has_key?(cine,sala)
  end

  def hay_sillas?(cine,sala,sillas) do
    if (Map.get(cine,sala) >= sillas ) do
      true
    else
      false
    end
  end

  def restar_sillas(cine,sala,sillas) do
    Map.put(cine,sala,fn valor -> valor - sillas end)
  end

end
Cine.main()
