defmodule Tutorials.Lists do
  @moduledoc """

  Function Summary:

  1. sum
  2. reverse
  3. map
  4. concat
  5. flat_map
  """

  # -------------------------- Sum ------------------------------

  @doc """
  Returns the sum of numbers in a list.

  ## Example

      iex> Tutorials.List.sum([1,2,3,4,5])
      15
      iex> Tutorials.List.sum_simple([1,2,3,4,5])
      15
      iex> Tutorials.List.sum_tail_rec([1,2,3,4,5])
      15
  """
  @spec sum(list(number())) :: number()
  def sum(nums), do: sum_tail_rec(nums)

  @spec sum_simple(list(number())) :: number()
  def sum_simple([]), do: 0
  def sum_simple([h | t]), do: h + sum(t)

  @spec sum_tail_rec(list(number()), integer()) :: number()
  def sum_tail_rec(nums, acc \\ 0)
  def sum_tail_rec([], acc), do: acc
  def sum_tail_rec([h | t], acc), do: sum_tail_rec(t, acc + h)

  # -------------------------- Reverse ---------------------------

  @doc """
  Returns the reverse list of numbers from the original list.

  ## Example

      iex> Tutorials.List.reverse([1,2,3,4,5])
      [5, 4, 3, 2, 1]

  """
  @spec reverse([any()], [any()]) :: [any()]
  def reverse(elements, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  # -------------------------- Map ------------------------------

  @doc """
  Returns a new list after perfoming a certain function that is passed.

  ## Example

      iex> Tutorials.Lists.map([1,2,3,4,5], fn x -> x + 2 end)
      [3, 4, 5, 6, 7]
  """
  @spec map([any()], (any -> any), [any()]) :: [any()]
  def map(elements, fun, acc \\ [])
  def map([], _, acc), do: reverse(acc)
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])


  @doc """
  Concatenate two lists that receives any type of data.

  ## Example

      iex> Tutorials.Lists.concat([1,2,3,4,5], [2,34])
      [1, 2, 3, 4, 5, 2, 34]
  """
  # -------------------------- Concat ------------------------------

  @spec concat([any], [any]) :: [any]
  def concat(src, dst), do: concat_func(src |> reverse(), dst)

  defp concat_func([], dst), do: dst
  defp concat_func([h | t], dst), do: concat_func(t, [h | dst])

  # -------------------------- FlatMap ------------------------------

  def flat_map(elements, func, acc \\ [])
  def flat_map([], _, acc), do: acc
  def flat_map([h | t], func, acc), do: flat_map(t, func, concat(acc, func.(h)))
end
