require_relative "../wcswidth"

module Kernel
  private

  def wcswidth(string)
    Wcswidth.of(string)
  end
end
