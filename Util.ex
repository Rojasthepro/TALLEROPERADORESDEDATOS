defmodule Util do
  # ---- Entrada de datos ----
  def ingresar(mensaje, :texto) do
    case System.cmd("java", ["-cp", ".", "Mensaje", "input", mensaje]) do
      {output, 0} ->
        String.trim(output) # Retorna el texto sin saltos de línea
      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
        nil
    end
  end

  def ingresar(mensaje, :entero) do
    IO.gets(mensaje)
    |> String.trim()
    |> String.to_integer()
  end

  def ingresar(mensaje, :real) do
    entrada = IO.gets(mensaje) |> String.trim()

    case Integer.parse(entrada) do
      {entero, ""} -> entero * 1.0        # permite ingresar 20 como 20.0
      _ -> String.to_float(entrada)       # permite ingresar 20.5
    end
  end

  # ---- Operaciones matemáticas ----
  def calcular_valor_descuento(valor, porcentaje) do
    valor * (porcentaje / 100)
  end

  def calcular_valor_final(valor, descuento) do
    valor - descuento
  end

  # ---- Mensajes ----
  def generar_mensaje(nombre) do
    "Hola #{nombre}, bienvenido/a a la empresa"
  end

  def generar_mensaje(descuento, final) do
  descuento_str = :erlang.float_to_binary(Float.round(descuento, 1), decimals: 1)
  final_str = :erlang.float_to_binary(Float.round(final, 1), decimals: 1)

  "Valor de descuento de $#{descuento_str} y el valor final $#{final_str}"
end



  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end
