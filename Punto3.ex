defmodule ValidarContrasena do
  def main do

    password="Ingrese la contraseña: "
              |>ingresar()

    []
    |> validar_longitud(password)
    |> validar_mayuscula(password)
    |> validar_numero(password)
    |> validar_espacios(password)
    |> generar_mensaje()
    |>mostrar_mensaje()

  end

  def ingresar(mensaje) do
    IO.gets(mensaje)
  end

  def validar_longitud(errores, password) do
    if String.length(password) < 8 do
      errores ++ ["Debe contener al menos 8 caracteres"]
    else
      errores
    end
  end

  def validar_mayuscula(errores, password) do
    lista=String.graphemes(password)
    if Enum.any?(lista, fn x -> x== String.upcase(x) end) do
      errores
    else
      errores ++ ["Debe contener al menos una mayúscula"]
    end
  end

  def validar_numero(errores, password) do
    if Enum.any?(String.graphemes(password), fn c -> c >= "0" and c <= "9" end) do
      errores
    else
      errores ++ ["Debe contener al menos un número"]
    end
  end

  def validar_espacios(errores, password) do
    if String.contains?(password, " ") do
      errores ++ ["No debe contener espacios"]
    else
      errores
    end
  end

  def generar_mensaje(errores) do
      case errores do
      [] -> {:ok, "Contraseña segura"}
      _ -> {:error, "Errores: " <> Enum.join(errores, ", ")}
    end
  end

  def mostrar_mensaje(mensaje) do
    IO.inspect(mensaje)
  end

end

ValidarContrasena.main()
