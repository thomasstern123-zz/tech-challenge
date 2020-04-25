alias Efood.Product
alias Efood.Repo

"../data/openfoodfacts.csv" #data file path
|> File.stream!
|> Stream.drop(1)
|> CSV.decode
|> Enum.each(fn
  {:ok, [_, url, _, _, _, product_name, _, _, _, _, _, _, categories, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _]}
  ->
    Product.changeset(%Product{},
      %{url: url,
        product_name: product_name,
        categories: categories})
    |> IO.inspect
    |> Repo.insert!
  {:error, message} ->
    IO.inspect message
  end)
