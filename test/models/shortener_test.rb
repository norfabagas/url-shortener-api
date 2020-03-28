require 'test_helper'

class ShortenerTest < ActiveSupport::TestCase
  test "create shortener" do
    shortener = Shortener.new
    assert_not shortener.save

    shortener.url = 'https://www.google.com'
    shortener.code = 'abcdefg'
    assert shortener.save!
  end

  test "find shortener" do
    shortener = Shortener.where(:code => 'abcdefg').take
    assert_not shortener.nil?
  end

  test "update shortener" do
    shortener = Shortener.where(:code => 'abcdefg').take
    shortener.code = 'loremipsum'
    shortener.save!

    assert (shortener.code == 'loremipsum')
  end

  test "destroy shortener" do
    shortener = Shortener.new(
      :url => 'http://localhost',
      :code => 'localhost'
    )
    shortener.destroy!

    assert Shortener.where(:code => 'localhost').take.nil?
  end
end