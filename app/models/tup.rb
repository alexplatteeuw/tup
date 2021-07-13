# frozen_string_literal: true

class Tup
  attr_reader :publication, :publications, :opposition_start, :opposition_end, :theoretical_opposition_end,
              :legal_effect

  STARTING_POINTS ||= %w[publication legal_effect].freeze

  def initialize(publication: false, legal_effect: false)
    # set TUP key dates from the desired publication date
    if publication

      @publication                = Date.parse(publication)
      @opposition_start           = @publication + 1
      @theoretical_opposition_end = @publication + 30
      @opposition_end             = @theoretical_opposition_end.compute_opposition_end
      @legal_effect               = @opposition_end + 1

    # set TUP key dates from the desired legal effect date
    elsif legal_effect

      @legal_effect       = Date.parse(legal_effect)
      @opposition_end     = @legal_effect - 1
      @publications       = @opposition_end.compute_publications
      if @publications.one?
        @publication      = @publications.first
        @opposition_start = @publication + 1
        remove_instance_variable(:@publications)
      end
    end
  end
end
