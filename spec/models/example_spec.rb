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
      let(:example) do
        Example.new(
          grammar_id: grammar.id
        )
      end

      it 'is invalid' do
        expect(example).to be_invalid
      end
    end
  end
end
