`import Ember from 'ember'`
`import _x from 'ember-autox-core/utils/xdash'`
`import defaultNewParams from '../utils/default-new-params'`
{isntModel} = _x
{isPresent} = Ember

createModel = (params) ->
  return unless @get("routeAction") is 'collection#new'
  @store.createRecord @get("defaultModelName"), params

createChild = (params) ->
  return unless @get("routeAction") is 'children#new'
  [..., relationName, _new] = @routeName.split(".")
  modelName = @get("defaultModelName")
  parent = @parentNodeModel()
  @store.createRecord modelName, defaultNewParams(relationName, parent, params)

AutoxRouteFormMixin = Ember.Mixin.create
  modelLoaders: [createModel, createChild]

  deactivate: ->
    model = @get("controller.model")
    return if isntModel(model)
    model.rollbackAttributes() if model?.get "hasDirtyAttributes"
    @_super arguments...

  actions:
    persistModel: (model) ->
      model.save()
      .then =>
        path = @defaultModelShowPath(model.constructor)
        @transitionTo path, model if isPresent path

`export default AutoxRouteFormMixin`
