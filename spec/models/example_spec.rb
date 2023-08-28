# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Example, type: :model do
  describe 'validation' do
    let(:dialect) { Dialect.first }
    let(:grammar) do
      Grammar.create!(
        dialect_id: dialect.id,
        description: 'grammar description',
        position: 1,
        label: 'something',
        commonness: 2
      )
    end

    context 'with necesarry attributes' do
      let(:example) do
        Example.new(
          grammar_id: grammar.id,
          language: 'en',
          sentence1: 'test sentence 1',
          sentence2: 'test sentence 2'
        )
      end

      it 'is valid' do
        expect(example).to be_valid
      end
    end

    context 'with missing attributes' do
      let(:example1) do
        Example.new(
          grammar_id: grammar.id
        )
      end
      let(:example2) do
        Example.new(
          grammar_id: grammar.id,
          language: 'en'
        )
      end
      let(:example3) do
        Example.new(
          grammar_id: grammar.id,
          language: 'en',
          sentence1: 'test sentence 1'
        )
      end
      let(:example4) do
        Example.new(
          grammar_id: grammar.id,
          language: 'en',
          sentence2: 'test sentence 2'
        )
      end
      let(:example5) do
        Example.new(
          grammar_id: grammar.id,
          sentence1: 'test sentence 1',
          sentence2: 'test sentence 2'
        )
      end

      it 'is invalid' do
        expect(example1).to be_invalid
        expect(example2).to be_invalid
        expect(example3).to be_invalid
        expect(example4).to be_invalid
        expect(example5).to be_invalid
      end
    end
  end
end
