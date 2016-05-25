`import Ember from 'ember'`
`import Dataview from 'ember-dataview'`
`import loadFields from '../utils/load-fields'`
`import DataviewBase from '../mixins/dataview-base'`
{RSVP} = Ember
loadModel = (store, {original, modelName, routeAction, routeName, parent, params}) ->
  store.findAll modelName

CollectionBaseDataview = Dataview.extend DataviewBase,
  loads:
    model: (metadata) ->
      return metadata.original if metadata.routeAction is 'collection#index'
      loadModel @get("store"), metadata
      .then (records) =>
        loadFields(@get("store"), records, metadata)
        .then (fields) ->
          {records, fields, metadata}


`export default CollectionBaseDataview`
