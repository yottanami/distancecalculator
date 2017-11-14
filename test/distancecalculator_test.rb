require "test_helper"


class DistancecalculatorTest < Minitest::Test

  def setup
    @customer_data = { 'longitude' => '-6.043701',
      'latitude' => '52.986375',
      'name' => 'Christina McArdle',
      'user_id' => 12 }
  end

  def test_that_it_has_a_version_number
    refute_nil ::Distancecalculator::VERSION
  end

  def test_distance
    customer = Distancecalculator::Customer.new(@customer_data)
    assert customer.distance, 5959.145768657998
  end

  def test_to_radian
    customer = Distancecalculator::Customer.new(@customer_data)
    rad = customer.send(:to_radian, 30)
    assert_equal rad, 0.5235987755982988
  end

  def test_is_nearby?
    customer = Distancecalculator::Customer.new(@customer_data)
    assert customer.nearby?
  end


  def test_is_not_nearby?
    customer_data = { 'longitude' => '-10.27699',
      'latitude' => '51.92893',
      'name' => 'Alice Cahill',
      'user_id' => 1 }
    customer = Distancecalculator::Customer.new(customer_data)
    refute customer.nearby?
  end
end
