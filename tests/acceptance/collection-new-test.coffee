`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAcceptance from '../../tests/helpers/module-for-acceptance'`
`import NewPage from 'dummy/tests/pages/dashboard/horses/new'`
`import IndexPage from 'dummy/tests/pages/dashboard/horse/index'`

moduleForAcceptance 'Acceptance: CollectionNew'

test 'visiting /dashboard/horses/new', (assert) ->
  container = @application.__container__
  NewPage.visit()

  andThen ->
    route = container.lookup "route:dashboard/horses/new"
    assert.ok route, "the horse route should be found"
    assert.equal route.routeName, "dashboard.horses.new",
      "we should have the proper routeName"
    assert.equal route.get("routeAction"), 'collection#new',
    "it should have the proper route action"

    assert.equal currentURL(), '/dashboard/horses/new'
    assert.equal NewPage.modelName, "horse",
      "the horse should be on this page"

    NewPage.createHorse "end-of-days", "arabian"

  andThen ->
    horse = server.db.horses[0]
    assert.ok horse, "we should have a horse"
    assert.equal horse?.name, "end-of-days",
      "the server should receive the horse"
    assert.equal currentPath(), "dashboard.horse.index",
      "We should be on the right page"
    assert.equal IndexPage.pageTitle, "Show Horse",
      "The right template should be rendering"
    assert.equal IndexPage.modelName, "horse",
      "we should have the right model"
    assert.equal IndexPage.name, "end-of-days",
      "The horse should have the proper name"
    assert.equal IndexPage.breed, "arabian",
      "The horse should be the proper breed"
