# frozen_string_literal: true

require_relative '../../app/clients/iterable/base'
require_relative '../../app/clients/iterable/create_user'
require_relative '../../app/services/event_creator'

describe EventCreator do
  let(:create_user) { instance_double('Iterable::CreateUser') }

  before do
    allow(Iterable::CreateUser).to receive(:new).and_return(create_user)
  end

  it 'creates event A' do
    allow(create_user).to receive(:call)

    creator = EventCreator.new(event_type: 'A')
    creator.call

    expect(create_user).to have_received(:call).once
  end

  it 'creates event B' do
    allow(create_user).to receive(:call)

    creator = EventCreator.new(event_type: 'B')
    creator.call

    expect(create_user).to have_received(:call).once
  end
end
