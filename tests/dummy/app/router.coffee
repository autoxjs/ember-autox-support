`import Ember from 'ember'`
`import config from './config/environment'`
`import Standardx from 'ember-autox-support/utils/standardx'`
`import DSL from 'ember-polymorphica/utils/dsl'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  {namespace, collection, form, view, model, child, children} = DSL.import(@).with Standardx

  namespace "dashboard", ->
    collection "horses", ->
      form "new"
    model "horse", ->
      form "edit"
      children "championships", ->
        form "new"
    model "championship"

`export default Router`
