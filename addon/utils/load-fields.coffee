`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

{chain} = _
{isArray, RSVP, isBlank, isEmpty, computed: {alias}} = Ember
NoFieldCollection = (modelName) -> """I expected to find field collection object
under the resolver name 'field:#{modelName}', but none was found. This is an
oversight on your part and is likely caused by you failing to declare a model
with the name: 'modelName' in your models directory."""
CollectionNoFields = (modelName) -> """I expected to find fields in the
collection, 'field:#{modelName}' but none was found, this is likely my fault.
Feel free to file a bug on github"""

loadFields = (store, model, {routeAction, routeName, modelPath, modelName})->
  collection = store.fieldsFor modelName
  throw new Error NoFieldCollection(modelName) if isBlank(collection)
  throw new Error CollectionNoFields(modelName) if isEmpty(fields = collection.get "sortedFields")
  chain(fields)
  .tap (fields) -> Ember.assert "is a proper array", isArray(fields)
  .map (field) -> field.initState {routeName, routeAction, modelPath, model}
  .thru RSVP.all
  .value()

`export default loadFields`
