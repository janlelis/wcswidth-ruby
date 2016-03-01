# coding: utf-8

require 'wcswidth/kernel_method'

describe 'wcswidth()' do
  describe '[east asian width]' do
    it 'returns 2 for F chars' do
      expect( wcswidth('！') ).to eq 2
    end

    it 'returns 2 for W chars' do
      expect( wcswidth('一') ).to eq 2
    end

    it 'returns 1 for N chars' do
      expect( wcswidth('À') ).to eq 1
    end

    it 'returns 1 for Na chars' do
      expect( wcswidth('A') ).to eq 1
    end

    it 'returns 1 for H chars' do
      expect( wcswidth('｡') ).to eq 1
    end

    # NOTE: This is not always correct
    it 'returns 1 for A chars' do
      expect( wcswidth('·') ).to eq 1
    end
  end

  describe '[general category]' do
    it 'returns 1 for non-special (non east width) chars' do
      expect( wcswidth('A') ).to eq 1
    end

    it 'returns 0 for Mn chars' do
      expect( wcswidth('ֿ') ).to eq 0
    end
  end
end
