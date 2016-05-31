`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

{RSVP, inject: {service}} = Ember
AutoxActionSupportMixin = Ember.Mixin.create
  routeData: service "route-data"
  fsm: service "field-state-machine"
  inferRoute: (state) ->
    return path if (path = state.get "fulfillmentPath")?
    anchorRoute = state.get "modelPath"
    modelName = state.get "activeModelname"
    @get('routeData').collectionRoute modelName, anchorRoute

  gohome: (state) ->
    anchorRoute = state.get "modelPath"
    modelName = state.get "modelName"
    route = @get('routeData').modelRoute modelName, anchorRoute
    model = state.get("model")
    return [route, model] if route? and model?

  handleNaiveAction: (state) ->
    switch
      when state.get("isComplete") and (name = state.get "bubblesName")?
        @send name, state.get("payload")
      when state.get("isNeedy") and (link = @inferRoute state)?
        @get("fsm").set "prev", state
        @transitionToRoute link
      when state.get("isNeedy")
        throw new Error "Unable to infer where to go to start fulfilling #{state.get "debugName"}"
      when state.get("isFulfilled") and (link = @gohome state)?
        @transitionToRoute link...

  handleComplexAction: (state) ->
    switch
      when state.get("isNeedy") and (link = @inferRoute state)?
        @transitionToRoute link
      when state.get("isNeedy")
        throw new Error "Unable to infer where to go to fulfill #{state.get "debugName"}"
      when state.get("isComplete") and (name = state.get "bubblesName")?
        @send name, state.get("payload")
      when state.get("isComplete") and (link = @gohome state)?
        @transitionToRoute link...
      when state.get("isComplete")
        throw new Error "Unsure what to do after completing #{state.get "debugName"}"
      when state.get("isFulfilled") and (link = @gohome state)?
        @transitionToRoute link...
      when state.get("isFulfilled")
        # Confirmation not implemented yet!
        throw new Error "Unsure where to go to receive confirmation to complete #{state.get "debugName"}"
      else throw new Error "Unsure what to do with #{state.get "debugName"}"

  handleModelAction: (state) ->
    if state.get("useCurrent")
      handler = @handleComplexAction.bind(@)
      cA = @get("fsm.currentAction")
      processState = _.bind cA.fulfillNextNeed, cA, @get("model")
    else
      processState = -> state
      handler = @handleNaiveAction.bind(@)
    state.invokeAction()
    .then processState
    .then handler

`export default AutoxActionSupportMixin`
