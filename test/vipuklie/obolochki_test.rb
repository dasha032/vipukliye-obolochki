#require "test_helper"
require "test/unit"
require_relative '..\..\lib\vipuklie\obolochki.rb'

class TestHulls < Test::Unit::TestCase
  def setup
    @algorithms = Vipuklie::Obolochki::Algorithms.new
  end

  test "test_jarvis_algorithm" do
    points = [
      [3, 0],
      [4, 2],
      [0, 7],
      [4,4],
      [2, 3],
      [5, 6],
      [2, 8]
    ]

    expected_hull = [
      [0, 7], [3, 0], [4, 2], [5, 6], [2, 8]
    ]

    assert_equal expected_hull, @algorithms.jarvis_march(points)
  end

  test "test_jarvis_algorithm_empty" do
    points = [
      [0, 0],
      [1, 1],
    ]

    expected_hull = []

    assert_equal expected_hull, @algorithms.jarvis_march(points)
  end

  test "test_graham_algorithm" do
    points = [
      [-7, 8],
      [-4, 6],
      [2, 6],
      [6, 4],
      [8, 6],
      [7, -2],
      [4, -6],
      [8, -7],
      [0, 0],
      [3, -2],
      [6, -10],
      [0, -6],
      [-9, -5],
      [-8, -2],
      [-8, 0],
      [-10, 3],
      [-2, 2],
      [-10, 4]
    ]

    expected_hull = [
      [6, -10], [8, -7], [8, 6], [-7, 8], [-10, 4], [-10, 3], [-9, -5]
    ]

    assert_equal expected_hull, @algorithms.graham_scan(points)
  end

  test "test_graham_algorithm_empty" do
    points = [[0, 0], [1, 1]]
    assert_empty(@algorithms.graham_scan(points))
  end

  test "test_graham_algorithm_another" do
    points = [
      [0, 3],
      [1, 1],
      [2, 2],
      [4, 4],
      [0, 0],
      [1, 2],
      [3, 1],
      [3, 3],
    ]

    expected_hull = [[0, 0], [3, 1], [4, 4], [0, 3]]

    assert_equal expected_hull, @algorithms.graham_scan(points)
  end
end
