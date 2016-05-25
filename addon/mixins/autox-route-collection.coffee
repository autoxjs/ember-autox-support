`import Ember from 'ember'`
AutoxRouteCollectionMixin = Ember.Mixin.create
  model: (params) ->
    @get("dataviews").eagerLoad @routeName,
      modelName: @get("defaultModelName")
      modelPath: @defaultModelShowPath()
      routeAction: @get("routeAction")
      routeName: @routeName
      parent: @parentNodeModel()
      params: params
      original: @_super arguments...

`export default AutoxRouteCollectionMixin`
