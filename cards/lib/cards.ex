defmodule Cards do

  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """



  @doc """
    Returns a list of string representing a deck of playing cards

  ## Examples

      iex(1)> Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Six of Spades", "Seven of Spades", "Eight of Spades",
      "Nine of Spades", "Ten of Spades", "Ace of Clubs", "Two of Clubs",
      "Three of Clubs", "Four of Clubs", "Five of Clubs", "Six of Clubs",
      "Seven of Clubs", "Eight of Clubs", "Nine of Clubs", "Ten of Clubs",
      "Ace of Hearts", "Two of Hearts","Three of Hearts", "Four of Hearts",
      "Five of Hearts", "Six of Hearts", "Seven of Hearts", "Eight of Hearts",
      "Nine of Hearts", "Ten of Hearts", "Ace of Diamonds", "Two of Diamonds",
      "Three of Diamonds", "Four of Diamonds", "Five of Diamonds", "Six of Diamonds",
      "Seven of Diamonds", "Eight of Diamonds", "Nine of Diamonds", "Ten of Diamonds"]

  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    suits = ["Spades","Clubs", "Hearts","Diamonds"]

    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end



  # # @doc """
  # #   Shuffles a deck of cards and randomly place them
  # # """
  # # def shuffle(deck) do
  # #   Enum.shuffle(deck)
  # # end



  # @doc """
  #   Determines whether a deck contains a given card.

  # ## Examples
  #     iex> deck = Cards.create_deck()
  #     iex> Cards.contains?(deck, "Ace of Spades")
  #     true

  # """
  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

  # @doc """
  #   Divides a deck into a hand and the remainder of the deck.
  #   The `hand_size` argument indicates how many cards should
  #   be in the hand.

  # ## Examples

  #     iex> deck = Cards.create_deck()
  #     iex> {hand, deck} = Cards.deal(deck, 1)
  #     iex> hand
  #     ["Ace of Spades"]
  #     iex> length(deck)
  #     39

  # """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  # @doc"""
  #   Recieves a deck of cards and a filename.
  #   Saves the cards on the deck inside the file using the erlang `term_to_binary/1`

  # ## Examples

  #     iex> deck = Cards.create_deck()
  #     iex> Cards.save(deck, "my_deck")
  #     :ok

  # """

  #Saving Contents to a file
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end


  # @doc"""
  #   Recieves the filename.
  #   Converts the binary values to Lists of Strings, and if file is not found
  #   an error message is shown.

  # ## Examples

  #     iex> Cards.load("my_deck")
  #     ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
  #     "Five of Spades", "Six of Spades", "Seven of Spades", "Eight of Spades",
  #     "Nine of Spades", "Ten of Spades", "Ace of Clubs", "Two of Clubs",
  #     "Three of Clubs", "Four of Clubs", "Five of Clubs", "Six of Clubs",
  #     "Seven of Clubs", "Eight of Clubs", "Nine of Clubs", "Ten of Clubs",
  #     "Ace of Hearts", "Two of Hearts", "Three of Hearts", "Four of Hearts",
  #     "Five of Hearts", "Six of Hearts", "Seven of Hearts", "Eight of Hearts",
  #     "Nine of Hearts", "Ten of Hearts", "Ace of Diamonds", "Two of Diamonds",
  #     "Three of Diamonds", "Four of Diamonds", "Five of Diamonds", "Six of Diamonds",
  #     "Seven of Diamonds", "Eight of Diamonds", "Nine of Diamonds",
  #     "Ten of Diamonds"]

  # """

  #Reading file contents
  def load(filename) do

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist";
    end
  end

  # @doc """
  #   Creates a deck of cards then divides a deck into a hand
  #   and the remainder of the deck.

  # ## Examples

  #     iex> Cards.create_hand(5)
  #     {["Eight of Hearts", "Three of Spades", "Four of Hearts", "Nine of Hearts",
  #     "Five of Clubs"], ["Two of Spades", "Four of Diamonds", "Nine of Clubs",
  #     "Two of Clubs", "Six of Hearts", "Five of Spades", "Four of Clubs",
  #     "Three of Clubs", "Seven of Clubs", "Ten of Spades", "Six of Diamonds",
  #     "Three of Diamonds", "Nine of Diamonds", "Three of Hearts", "Ace of Clubs",
  #     "Two of Hearts", "Five of Diamonds", "Four of Spades", "Eight of Diamonds",
  #     "Eight of Clubs", "Ace of Hearts", "Ace of Spades", "Ten of Diamonds",
  #     "Seven of Spades","Seven of Diamonds", "Five of Hearts", "Two of Diamonds",
  #     "Ten of Hearts","Eight of Spades", "Ace of Diamonds", "Six of Clubs",
  #     "Nine of Spades","Ten of Clubs", "Six of Spades", "Seven of Hearts"]}

  # """

  
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Enum.shuffle()
    #|> Cards.shuffle() Alternative way
    |> Cards.deal(hand_size)
  end
end
