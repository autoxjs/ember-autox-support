`import Ember from 'ember'`

hasStuff = (hash={}) ->
  Ember.isPresent Object.keys(hash)

loadCollection = (params) ->
  return unless @get("routeAction") in ["namespace#collection", "collection"]
  if hasStuff params
    @store.query @get("defaultModelName"), params
  else
    @store.findAll @get "defaultModelName"
AutoxRouteCollectionMixin = Ember.Mixin.create
  modelLoaders: [loadCollection]

`export default AutoxRouteCollectionMixin`
