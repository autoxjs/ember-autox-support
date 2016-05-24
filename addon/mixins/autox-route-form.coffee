`import Ember from 'ember'`
`import _x from 'ember-autox-core/utils/xdash'`
{isntModel} = _x
{isPresent} = Ember
AutoxRouteFormMixin = Ember.Mixin.create
  deactivate: ->
    dataview = @get("controller.model")
    model = @get("controller.model.value")
    return if isntModel(model)
    dataview.reset()
    model.rollbackAttributes() if model?.get "hasDirtyAttributes"
    @_super arguments...

  model: (params) ->
    @get("dataviews").eagerLoad @routeName,
      modelName: @get("defaultModelName")
      modelPath: @defaultModelShowPath()
      routeAction: @get("routeAction")
      routeName: @routeName
      parent: @parentNodeModel()
      params: params
      original: @_super(arguments...)

  actions:
    modelCreated: (model) ->
      model.save()
      .then =>
        path = @defaultModelShowPath(model.constructor)
        @transitionTo path, model if isPresent path
`export default AutoxRouteFormMixin`
