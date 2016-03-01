module Wcswidth
end

begin
  require "rbconfig/sizeof"

  Wcswidth::MAX_WIDTH  = 256 ** RbConfig::SIZEOF["size_t"] - 1
  Wcswidth::WCHAR_SIZE = RbConfig::SIZEOF["wchar_t"]
rescue LoadError
end

require "rbconfig"

unless defined?(Wcswidth::MAX_WIDTH) && Wcswidth::MAX_WIDTH
  Wcswidth::MAX_WIDTH = 18446744073709551615
end

unless defined?(Wcswidth::WCHAR_SIZE) && Wcswidth::WCHAR_SIZE
  if RbConfig::CONFIG["host_os"] =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/
    Wcswidth::WCHAR_SIZE = 2
  else
    Wcswidth::WCHAR_SIZE = 4
  end
end

Wcswidth::WCHAR_TEMPLATE = {
  1 => 'C*',
  2 => 'S*',
  4 => 'L*',
  8 => 'Q*'
}[Wcswidth::WCHAR_SIZE].freeze