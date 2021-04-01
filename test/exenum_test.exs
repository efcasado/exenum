###========================================================================
### File: ExEnumTest.ex
###
### Unit tests
###
### Author(s):
###   - Enrique Fernandez <efcasado(at)gmail.com>
###========================================================================
defmodule ExEnumTest do
  ##== Preamble ===========================================================
  use ExUnit.Case

  
  ##== Test modules =======================================================
  # Enumeration with implicit keys
  defmodule Planet do
    use ExEnum, from: [
      "MERCURY",
      "VENUS",
      "EARTH",
      "MARS",
      "JUPITER",
      "SATURN",
      "URANUS",
      "NEPTUNE"
    ]
  end

  # Enumeration with explicit keys
  defmodule Direction do
    use ExEnum, from: [
      {:north, 1},
      {:east, 2},
      {:south, 3},
      {:west, 4}
    ]
  end


  ##== Unit tests ==========================================================
  test "Get value via implicit key" do
    assert Planet._EARTH == "EARTH"
  end
  
  test "Get value via exlicit key" do
    assert Direction.north == 1
  end
  
  test "Get all values" do
    assert Planet.values == ["MERCURY", "VENUS", "EARTH", "MARS", "JUPITER",
			     "SATURN", "URANUS", "NEPTUNE"]
  end
  
  test "Get all implicit keys" do
    assert Planet.keys == [:_MERCURY, :_VENUS, :_EARTH, :_MARS, :_JUPITER,
			   :_SATURN, :_URANUS, :_NEPTUNE]
  end

  test "Get all explicit keys" do
    assert Direction.keys == [:north, :east, :south, :west]
  end

  test "Valid enumartion value" do
    assert Planet.is_valid?("EARTH") == true
  end

  test "Invalid enumeration value" do
    assert Planet.is_valid?("PLUTO") == false
  end

  test "Enum from value" do
    assert Planet.from_value("EARTH") == "EARTH"
  end

  test "Enum from homomorphic value" do
    assert Direction.from_value(1) == :north
  end

  test "Invalid enum from value" do
    assert Direction.from_value(-1) == nil
  end

end
