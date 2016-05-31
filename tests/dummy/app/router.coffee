`import Ember from 'ember'`
`import config from './config/environment'`
`import Standardx from 'ember-autox-support/utils/standardx'`
`import DSL from 'ember-polymorphica/utils/dsl'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  {namespace, collection, form, view, model, child, children} = DSL.import(@).with Standardx

  namespace "dashboard", ->
    model "owner", ->
      children "horses"
    collection "horses", ->
      form "new"
    model "horse", ->
      form "edit"
      child "owner"
      children "championships", ->
        form "new"
    model "championship"

`export default Router`
