defmodule Cards do
  @moduledoc """
    Provides functions for creating and handling a deck of cards
  """

  def create_hand(hand_size) do
    {hand, _deck} = create_deck()
                      |> shuffle
                      |> deal(hand_size)
    hand
  end

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end 
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines if a deck contains a given card

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Clubs")
      true

  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in a hand.
    `Cards.load/1`


  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 5)
      iex> hand
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades", "Five of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end
end
