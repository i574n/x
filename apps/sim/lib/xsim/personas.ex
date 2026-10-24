defmodule Xsim.Personas do
  @kinds %{"lurker" => :lurker, "fickle" => :fickle, "editor" => :editor, "breaker" => :breaker}

  def parse(nil), do: []

  def parse(text) do
    text
    |> String.split([",", "+"], trim: true)
    |> Enum.flat_map(fn entry ->
      with [name, count] <- String.split(String.trim(entry), "="),
           {:ok, kind} <- Map.fetch(@kinds, name),
           {n, ""} when n >= 0 <- Integer.parse(count) do
        List.duplicate(kind, n)
      else
        _ -> raise ArgumentError, "persona #{inspect(entry)} is not <#{Enum.join(Map.keys(@kinds), "|")}>=<count>"
      end
    end)
  end
end
