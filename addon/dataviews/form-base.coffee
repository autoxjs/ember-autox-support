`import Dataview from 'ember-dataview'`
`import loadFields from '../utils/load-fields'`
`import defaultNewParams from '../utils/default-new-params'`
`import DataviewBase from '../mixins/dataview-base'`

loadModel = (store, {original, modelName, routeAction, routeName, parent, params}) ->
  switch routeAction
    when 'collection#new'
      store.createRecord modelName, params
    when 'children#new'
      [..., relationName, _new] = routeName.split(".")
      store.createRecord modelName, defaultNewParams(relationName, parent, params)
    else original

NewBaseDataview = Dataview.extend DataviewBase,
  loads:
    model: (metadata) ->
      record = loadModel(@get("store"), metadata)
      loadFields(@get("store"), record, metadata)
      .then (fields) -> {record, fields, metadata}

`export default NewBaseDataview`
