require 'spec_helper'

describe TexturesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get('/textures')).to route_to('textures#index')
    end

    it 'routes to #new' do
      expect(get('/textures/new')).to route_to('textures#new')
    end

    it 'routes to #show' do
      expect(get('/textures/1')).to route_to('textures#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get('/textures/1/edit')).to route_to('textures#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post('/textures')).to route_to('textures#create')
    end

    it 'routes to #update' do
      expect(put('/textures/1')).to route_to('textures#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete('/textures/1')).to route_to('textures#destroy', id: '1')
    end
  end
end
