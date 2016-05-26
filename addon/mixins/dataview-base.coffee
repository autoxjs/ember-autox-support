`import Ember from 'ember'`
`import loadFields from '../utils/load-fields'`

DataviewBaseMixin = Ember.Mixin.create
  mergedProperties: ['loads']

  loads:
    fields: (metadata) ->
      loadFields(@get("store"), metadata.model, metadata)
    metadata: (data) -> data

`export default DataviewBaseMixin`
