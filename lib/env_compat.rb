require "env_compat/version"

module EnvCompat
  class << self
    def encode str
      builder = ''
      _ = CodeBlock.new
      str.chars.each do |chr|
        case chr
        when *mapping.values
          builder = _.toggle(builder) unless _.in_block?
          builder << mapping.invert[chr]
        else
          builder = _.toggle(builder) if _.in_block?
          builder << chr
        end
      end
      builder.upcase
    end

    def decode str
      builder = ''
      _ = CodeBlock.new
      str.chars.each do |chr|
        next _.cycle if chr == '_'
        if _.in_block?
          case chr
          when *mapping.keys
            builder << mapping[chr]
          else
            raise "Invalid input!"
          end
        else
          builder << chr
        end
      end
      builder.upcase
    end

    private
    def mapping
      {
        'F' => '/', # Forward Slash
        'C' => ':', # Colon
        'M' => '-', # Minus
        'U' => '_', # Underscore
        'D' => '.'  # Dot
      }
    end

    class CodeBlock
      def initialize
        @code_block = [false, true].cycle
      end
       
      def cycle
        @code_block.next
      end

      def in_block?
        @code_block.peek
      end

      def toggle str
        @code_block.next
        str + '_'
      end
    end 
    private_constant :CodeBlock
  end
end
