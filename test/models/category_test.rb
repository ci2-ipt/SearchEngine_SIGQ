# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'if model can be saved with null atributtes' do
    c = Category.new
    assert !c.save
  end

  test 'if model can be saved with a name that contains numbers' do
    c = Category.new
    c.name = 'Relatório'
    if c.name.count('0-9').positive?
      assert !c.save
    else
      assert c.save
    end
  end

  test 'if model can be saved with a name that contains spaces' do
    c = Category.new
    c.name = 'Relatório'
    (0..c.name.length).each do |j|
      if c.name[j] == ' '
        assert !c.save
        break
      else
        assert c.save
      end
    end
  end

  test 'if model can be saved with a name that contains special characters' do
    c = Category.new
    c.name = 'Relatório'
    if c.name.scan(%r{[!@#$%^&*()_+{}\[\]:;'"/\\?><.,]}).empty?
      assert c.save
    else
      assert !c.save
    end
  end

  test 'if model can be saved with a name bigger than 15 characters' do
    c = Category.new
    c.name = 'Relatório'
    if c.name.count('a-zA-Z') > 15
      assert !c.save
    else
      assert c.save
    end
  end

  test 'if model can be saved with a name smaller than 5 characters' do
    c = Category.new
    c.name = 'Relatório'
    if c.name.count('a-zA-Z') < 5
      assert !c.save
    else
      assert c.save
    end
  end

  test 'if model can be saved with a name that is a repeatable character' do
    c = Category.new
    c.name = 'Relatório'
    ('a'..'z').each do |letter|
      if c.name.count(letter) == c.name.length
        assert !c.save
        break
      else
        assert c.save
      end
    end

    ('A'..'Z').each do |letter|
      if c.name.count(letter) == c.name.length
        assert !c.save
        break
      else
        assert c.save
      end
    end
  end

  #liting test
  test 'if model can be saved with a name that contains uppercase letters besides the first character' do
    c = Category.new
    c.name = 'Relatório'
    ('A'..'Z').each do |letter|
      (1..c.name.length).each do |j|
        assert !c.save if c.name[j] == letter
      end
    end
    assert !c.save if c.name.match(/[ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖÙÚÛÜÝ]/)
    assert c.save
  end

  test 'if model can be saved with a name that starts with a lowercase character' do
    c = Category.new
    c.name = 'Relatório'
    ('a'..'z').each do |letter|
      assert !c.save if c.name[0] == letter
    end
    assert c.save
  end
end
