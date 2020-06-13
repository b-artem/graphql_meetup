# frozen_string_literal: true

describe Movie::Operation::Search, type: :operation do
  let(:execute_operation) { described_class.call(params: { filter: nil }) }

  let(:matching_movie) { create :movie, title: 'Iron Man' }
  let(:movie) { create :movie, title: 'Batman' }

  let(:all_movies) do
    [matching_movie, movie]
  end

  context 'when movies exist' do
    before { all_movies }

    context 'when no filter specified' do
      it 'executes with success' do
        expect(execute_operation).to be_success
      end

      it 'returns all movies' do
        result = execute_operation

        expect(result['result']).to all(be_a Movie)
        expect(result['result'].size).to eq all_movies.count
      end
    end

    context 'when filter specified' do
      let(:execute_operation) { described_class.call(params: { filter: 'iron' }) }

      it 'executes with success' do
        expect(execute_operation).to be_success
      end

      it 'returns filtered movies only' do
        result = execute_operation

        expect(result['result']).to all(be_a Movie)
        expect(result['result'].size).to eq 1
        expect(result['result'].first.id).to eq matching_movie.id
      end
    end
  end

  context 'when movies do NOT exist' do
    it 'executes with success' do
      expect(execute_operation).to be_success
    end

    it 'returns an empty array' do
      result = execute_operation

      expect(result['result']).to be_empty
    end
  end
end
