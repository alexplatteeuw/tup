# frozen_string_literal: true

require './app'
require 'test/unit'
require 'rack/test'

set :environment, :test

class TupTest < Test::Unit::TestCase
  include Rack::Test::Methods

  @@tups ||= YAML.load_file("#{File.dirname(__FILE__)}/dates_for_testing.yml")

  def app
    app = lambda -> { [200, { 'Content-Type' => 'text/plain' }, ['All responses are OK']] }
    builder = Rack::Builder.new
    builder.run app
  end

  def test_dates_from_publication_should_be_correct
    @@tups.each do |given_tup|
      tup = Tup.new(publication: given_tup[:publication])
      assert_equal(given_tup[:publication], tup.publication.strftime('%d/%m/%Y'))
      assert_equal(given_tup[:start], tup.opposition_start.strftime('%d/%m/%Y'))
      assert_equal(given_tup[:end], tup.opposition_end.strftime('%d/%m/%Y'))
      assert_equal(given_tup[:legal_effect], tup.legal_effect.strftime('%d/%m/%Y'))
    end
  end
end
