defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomises it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "dealing a deck returns defined hand" do
    deck = Cards.create_deck
    hand_size = 5
    {hand, _deck} = Cards.deal(deck, hand_size)
    
    assert hand_size == length(hand)
  end
end
