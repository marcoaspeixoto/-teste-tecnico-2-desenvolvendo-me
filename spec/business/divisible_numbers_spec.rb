require 'rails_helper'

RSpec.describe 'Números divisíveis' do
  it '1: Retorna todos os números divisíveis por w entre x e y ' do
    test = DivisibleNumbers.new
    res = test.divisible_numbers(10, 30, 5)
    expect(res).to eq([10, 15, 20, 25, 30])
  end
end

