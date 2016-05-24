`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

{isFunction} = _
{isPresent, isBlank, computed, inject: {service}} = Ember
assertRoute = (router, name) ->
  if router.hasRoute name
    return name
  else
    throw new Error """In the route for you tried to pass off '#{name}'
    as a route, but it wasn't one. Fix it, dumbass
    """
AutoxRouteBaseMixin = Ember.Mixin.create
  routeData: service "route-data"
  dataviews: service "dataviews"
  routing: service "-routing"
  routeAction: computed "routeName", ->
    return if isBlank @routeName
    @get("routeData").routeAction @routeName
  defaultModelName: computed "routeName", ->
    return if isBlank @routeName
    @get("routeData").routeModel @routeName
  defaultModelFactory: computed "defaultModelName", ->
    name = @get "defaultModelName"
    @store.modelFor(name) if isPresent(name)

  defaultModelShowPath: (factory) ->
    factory ?= @get "defaultModelFactory"
    routeName = factory?.aboutMe?.routeName
    return assertRoute(@get("routing"), routeName(@, model)) if isFunction(routeName)
    return assertRoute(@get("routing"), routeName) if isPresent routeName
    return if routeName is false
    @get("routeData").modelRoute factory?.modelName, @routeName

  parentNodeRoute: ->
    @get("routeData").parentNodeRoute @routeName

  parentNodeModel: ->
    @modelFor route if isPresent(route = @parentNodeRoute())

`export default AutoxRouteBaseMixin`
