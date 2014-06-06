require 'active_support/core_ext/string/output_safety'
require "forwardable"

module ActionView
  class OutputBuffer #:nodoc:
    extend Forwardable

    def_delegator :@buffer, :encoding
    def_delegator :@buffer, :force_encoding

    def initialize(s="")
      @buffer = s
    end

    def html_safe?
      true
    end

    def html_safe
      self
    end

    def presence
      return self if @buffer.presence
      false
    end

    def to_s
      @buffer.html_safe
    end

    def <<(value)
      return self if value.nil?
      @buffer << ERB::Util.h(value)
    end
    alias :append= :<<

    def safe_concat(value)
      return self if value.nil?
      @buffer << value
    end
    alias :safe_append= :safe_concat
  end

  class StreamingBuffer #:nodoc:
    def initialize(block)
      @block = block
    end

    def <<(value)
      value = value.to_s
      value = ERB::Util.h(value) unless value.html_safe?
      @block.call(value)
    end
    alias :concat  :<<
    alias :append= :<<

    def safe_concat(value)
      @block.call(value.to_s)
    end
    alias :safe_append= :safe_concat

    def html_safe?
      true
    end

    def html_safe
      self
    end
  end
end
