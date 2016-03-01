require_relative "wcswidth/version"
require_relative "wcswidth/sizes"
require_relative "wcswidth/libc"

module Wcswidth
  def self.of(string, max_width = MAX_WIDTH)
    LibC.wcswidth(
      [
        *string.to_s.  # ensure we are working with a string
        tr("\0", "").  # remove 0 bytes (length is 0)
        codepoints,    # convert to integer character representations
        0              # append 0 byte
      ].pack(WCHAR_TEMPLATE), # generate wchar_t byte representation
      max_width        # pass max column width
    )
  end
end

