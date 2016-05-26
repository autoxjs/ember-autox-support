`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

{last} = _

hasStuff = (hash={}) ->
  Ember.isPresent Object.keys(hash)

loadCollection = (params) ->
  return unless @get("routeAction") in ["namespace#collection", "collection"]
  if hasStuff params
    @store.query @get("defaultModelName"), params
  else
    @store.findAll @get "defaultModelName"

loadChildren = (params) ->
  return unless @get("routeAction") is 'model#children'
  relationName = last @routeName.split(".")
  @parentNodeModel()?.get relationName

AutoxRouteCollectionMixin = Ember.Mixin.create
  modelLoaders: [loadCollection, loadChildren]

`export default AutoxRouteCollectionMixin`
