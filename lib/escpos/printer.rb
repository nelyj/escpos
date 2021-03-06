require 'base64'

module Escpos

  class Printer

    def initialize
      # ensure only supported sequences are generated
      @data = "".force_encoding("ASCII-8BIT")
      @data << Escpos.sequence(HW_INIT)
    end

    def write(data)
      @data << data
    end

    def partial_cut!
      @data << Escpos.sequence(PAPER_PARTIAL_CUT)
    end

    def cut!
      @data << Escpos.sequence(PAPER_FULL_CUT)
    end

    def to_escpos
      @data
    end

    def to_base64
      Base64.strict_encode64 @data
    end

  end
end
