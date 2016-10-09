defmodule ExEnum do

  ##== API ================================================================

  # Callback invoked by `use`.
  defmacro __using__(opts) do
    data = opts[:from]

    kvs = Enum.map(
      data,
      fn({k, v}) -> {k, v}
	(v) ->
	  k = to_fname(v)
	  {k, v}
      end)

    ks = Keyword.keys(kvs)
    vs = Keyword.values(kvs)

    ks_f = quote do: def keys(), do: unquote(ks)
    vs_f = quote do: def values(), do: unquote(vs)
    iv_f =
      Enum.reduce(
    	vs,
    	[quote do: def is_valid?(_), do: false],
    	fn(v, acc) ->
    	  f = quote do: def is_valid?(unquote(v)), do: true
	  [f| acc]
    	end)

    fs   =
      Enum.map(
	kvs,
	fn
	  {k, v} ->
	    quote do: def unquote(k)(), do: unquote(v)
	end)
    
    List.flatten([ks_f, vs_f, iv_f, fs])
  end

  
  ##== Auxiliary functions ================================================

  defp to_fname(atom) when is_atom(atom) do
    atom
  end
  defp to_fname(str) do
    String.to_atom("_" <> to_string(str))
  end

end
