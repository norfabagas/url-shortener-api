require 'test_helper'

class StatisticTest < ActiveSupport::TestCase
  
  require 'ipaddr'

  test "add statistic" do
    statistic = create_statistic

    assert statistic
  end

  test "count statistic" do
    shortener = get_shortener

    assert shortener.statistics.count == Statistic.where(:shortener => get_shortener).count
  end

  test "update statistic" do
    statistic = create_statistic
    statistic.ip_address = '127.0.0.1'
    statistic.save!
    
    assert statistic.ip_address == '127.0.0.1'
  end

  test "destroy statistic" do
    statistic = create_statistic

    assert_not statistic.nil?

    statistic.destroy

    assert_not Statistic.where(:ip_address => statistic.ip_address).take
  end

  private

  def get_shortener
    return Shortener.first
  end

  def create_statistic
    return Statistic.new(
      :shortener => get_shortener,
      :ip_address => IPAddr.new(rand(2**32),Socket::AF_INET)
    )
  end
end
