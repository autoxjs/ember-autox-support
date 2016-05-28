`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

{RSVP} = Ember
{last} = _

loadChild = (params, original) ->
  return unless @get("routeAction") is 'model#child'
  relationName = last @routeName.split(".")
  @parentNodeModel()?.get(relationName)

AutoxRouteModelMixin = Ember.Mixin.create
  modelLoaders: [loadChild]

`export default AutoxRouteModelMixin`
