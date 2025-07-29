defmodule BibleLookup do
  def get_verse(reference) do
    url = "https://bible-api.com/#{URI.encode(reference)}"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, %{"reference" => ref, "text" => text}} ->
            IO.puts("\n#{ref}: #{text}\n")
          _ ->
            IO.puts("Couldn't parse verse data.")
        end

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Verse not found.")

      {:error, reason} ->
        IO.puts("Error: #{inspect(reason)}")
    end
  end

  def loop do
    IO.write("Enter a Bible verse (or 'exit' to quit): ")
    reference = IO.gets("") |> String.trim()

    case reference do
      "" -> 
        IO.puts("Goodbye!")
        :ok

      "exit" -> 
        IO.puts("Goodbye!")
        :ok

      _ -> 
        get_verse(reference)
        loop()
    end
  end
end

