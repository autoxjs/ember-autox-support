`import Ember from 'ember'`
{String} = Ember

defaultNewParams = (relationName, parent, params={}) ->
  factory = parent?.constructor
  modelName = factory?.inverseFor(String.camelize relationName)?.name
  modelName ?= factory?.modelName
  params[modelName] = parent if modelName?
  params

`export default defaultNewParams`
