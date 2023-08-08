defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  # test "greets the world" do
  #   assert Cards.hello() == :world
  # end

  # test "the truth" do
  #   assert 1 + 1 == 2
  # end

  test "create_deck makes 40 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 40
  end

  # test "deal func" do
  #   deck = Cards.create_deck()
  #   {hand, deck} = Cards.deal(deck, 1)
  #   assert hand == ["Ace of Spades"]
  #   assert length(deck) == 39
  # end

  # test "shuffling a deck randomizes it" do
  #   deck = Cards.create_deck()
  #   refute deck == Enum.shuffle(deck)
  #   #refute deck == Cards.shuffle(deck)
  #   #assert deck != Enum.shuffle(deck)
  #   #assert deck != Cards.shuffle(deck)
  # end

  # test "Saving deck to a file" do
  #   deck = Cards.create_deck()
  #   ans = Cards.save(deck, "my_deck")
  #   assert ans == :ok
  # end
end
