`import Ember from 'ember'`
`import _x from 'ember-autox-core/utils/xdash'`
{isntModel} = _x
{isPresent} = Ember
AutoxRouteModelMixin = Ember.Mixin.create
  model: (params) ->
    @get("dataviews").eagerLoad @routeName,
      modelName: @get("defaultModelName")
      modelPath: @defaultModelShowPath()
      routeAction: @get("routeAction")
      routeName: @routeName
      parent: @parentNodeModel()
      params: params
      original: @_super arguments...

`export default AutoxRouteModelMixin`
