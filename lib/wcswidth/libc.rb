require "ffi"

module Wcswidth
  module LibC
    extend FFI::Library

    ffi_lib FFI::Library::LIBC
    attach_function :wcswidth, [ :buffer_in, :size_t ], :int
  end

  private_constant :LibC
end