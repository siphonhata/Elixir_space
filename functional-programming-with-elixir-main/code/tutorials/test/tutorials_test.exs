defmodule TutorialsTest do
  use ExUnit.Case
  doctest Tutorials



  test "test the sum functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 15
  end

  test "test the sum_simple functions" do
    ans = Tutorials.Lists.sum_simple([1,2,3,4,5])
    assert ans == 15
  end

  test "test the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 15
  end

  #----------------------------------------------------------------------
  test "test1 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 15
  end

  test "test2 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 15
  end

  test "test3 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 15
  end

  test "test4 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 15
  end

  test "test5 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 15
  end

  test "test6 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 15
  end

  test "test7 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 125
  end

  test "test8 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 5
  end

  test "test9 the sum_tail_rec functions" do
    ans = Tutorials.Lists.sum_tail_rec([1,2,3,4,5])
    assert ans == 1
  end
  #--------------------------------------------------------------------------
  test "test a reverse list" do

    assert Tutorials.Lists.reverse([1,2,3,4,5]) == [5, 4, 3, 2, 1]
  end

  test "test maps with maps fn" do
    assert Tutorials.Lists.map([1,2,3,4,5], fn x -> x + 2 end) == [3, 4, 5, 6, 7]
  end

  test "Concatenating two lists" do

    assert Tutorials.Lists.concat([50,2,3,4,5], [2,34]) == [50, 2, 3, 4, 5, 2, 34]
  end
end
