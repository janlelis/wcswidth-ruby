# wcswidth [![[version]](https://badge.fury.io/rb/wcswidth.svg)](https://badge.fury.io/rb/wcswidth) [![[ci]](https://github.com/janlelis/wcswidth/workflows/Test/badge.svg)](https://github.com/janlelis/wcswidth/actions?query=workflow%3ATest)

Determine terminal display width (columns) of Ruby strings via [FFI bindings](https://github.com/ffi/ffi/wiki) to libc's [wcswidth()](http://man7.org/linux/man-pages/man3/wcswidth.3.html) function.

See [unicode/display_width](https://github.com/janlelis/unicode-display_width) for a Ruby-only unicode data based approach.

## Usage

```ruby
require 'wcswidth/kernel_method'

# full width chars
wcswidth("！") # => 2
wcswidth("一") # => 2

# single width chars
wcswidth("A") # => 1
wcswidth("·") # => 1

# zero width chars
wcswidth("ֿ") # => 0
wcswidth("\0") # => 0

# control chars
wcswidth("\x01") # => -1
wcswidth("\n") # => -1
```

Without opting in for `wcswidth/kernel_method` it is `Wcswidth.of("string")`

## MIT License

Copyright (C) 2016 Jan Lelis <https://janlelis.com>. Released under the MIT license.
