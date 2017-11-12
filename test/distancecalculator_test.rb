require "test_helper"

class DistancecalculatorTest < Minitest::Test

  def setup
    @customer_data = { longitude: '121212',
      latitude: '12321',
      name: 'Test',
      user_id: 'df' }
  end

  def test_that_it_has_a_version_number
    refute_nil ::Distancecalculator::VERSION
  end

  def test_distance
    customer = Customer.new(@customer_data)
    assert_equal customer.distance 1234
  end

  def test_to_radian
    customer = Customer.new(@customer_data)
    rad = customer.send(:to_radian, 30)
    assert_equal rad, 23323
  end

  def test_nearby?
    customer_data = { longitude: '121212',
      latitude: '12321',
      name: 'Test',
      user_id: 'df' }
    customer = Customer.new(customer_data)
    assert_true customer.nearby?
  end

end
