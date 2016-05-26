`import Ember from 'ember'`

{isPresent, isBlank, typeOf, computed, set, get, inject: {service}} = Ember
assertRoute = (router, name) ->
  if router.hasRoute name
    return name
  else
    throw new Error """In the route for you tried to pass off '#{name}'
    as a route, but it wasn't one. Fix it, dumbass"""

xx = (x) ->
  console.log x
  x

AutoxRouteBaseMixin = Ember.Mixin.create
  concatenatedProperties: ["modelLoaders"]
  routeData: service "route-data"
  dataviews: service "dataviews"
  routing: service "-routing"
  autoxTempStorageName: computed "routeAction", ->
    "_autoxTempStorage-#{@get "routeAction"}"
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
    return assertRoute(@get("routing"), routeName(@, model)) if typeOf(routeName) is "function"
    return assertRoute(@get("routing"), routeName) if isPresent routeName
    return if routeName is false
    @get("routeData").modelRoute factory?.modelName, @routeName

  parentNodeRoute: ->
    @get("routeData").parentNodeRoute @routeName

  parentNodeModel: ->
    @modelFor route if isPresent(route = @parentNodeRoute())

  model: (params) ->
    {modelLoaders, routeAction} = @getProperties "modelLoaders", "routeAction"
    return @_super(arguments...) if isBlank(routeAction) or isBlank(modelLoaders)
    for f in modelLoaders when isBlank(model)
      model = f.call @, params
    model ? @_super(arguments...)

  afterModel: (model) ->
    return unless typeOf model in ["object", "array", "instance"]
    @get("dataviews").eagerLoad @routeName,
      model: model
      modelName: @get("defaultModelName")
      modelPath: @defaultModelShowPath()
      routeAction: @get("routeAction")
      routeName: @routeName
      parent: @parentNodeModel()
    .then (dataview) =>
      set model, @get("autoxTempStorageName"), dataview

  setupController: (controller, model) ->
    dataview = get model, @get("autoxTempStorageName")
    controller.set "dataview", dataview
    @_super controller, model

`export default AutoxRouteBaseMixin`
