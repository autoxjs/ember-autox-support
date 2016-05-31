`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAcceptance from '../../tests/helpers/module-for-acceptance'`
`import OwnerPage from 'dummy/tests/pages/dashboard/owner/index'`
`import HorsesIndex from 'dummy/tests/pages/dashboard/horses/index'`
`import HorsePage from 'dummy/tests/pages/dashboard/horse/index'`
`import OwnerHorses from 'dummy/tests/pages/dashboard/owner/horses/index'`
moduleForAcceptance 'Acceptance: Multiaction',
  beforeEach: ->
    @owner = server.create "owner"
    @horses = server.createList "horse", 5
test 'action and redirection', (assert) ->
  OwnerPage.visit id: @owner.id

  andThen =>
    assert.equal currentURL(), "/dashboard/owner/#{@owner.id}",
      "We should be on the right URL"
    assert.equal OwnerPage.pageTitle, "Show Owner",
      "we should have the right page title"
    assert.equal OwnerPage.name, @owner.name,
      "the owner named should match"
    OwnerPage.purchaseHorse()

  andThen =>
    assert.equal currentPath(), "dashboard.horses.index",
      "we should be redirected to the horse index page"
    assert.equal HorsesIndex.pageTitle, "Horses",
      "we should have the right page title"
    assert.equal HorsesIndex.horses().count, 5,
      "we should have 5 horses"
    HorsesIndex.horses(0).click()

  andThen =>
    assert.equal currentPath(), "dashboard.horse.index",
      "we should be on the horse page"
    assert.ok HorsePage.canBeSelected,
      "because we have a current action, the horse should be selectable"
    HorsePage.selectForAction()

  andThen =>
    assert.equal currentURL(), "/dashboard/owner/#{@owner.id}",
      "we should be redirected back to the owner page"

    OwnerPage.gotoHorses()

  andThen =>
    assert.equal currentPath(), 'dashboard.owner.horses.index',
      "we should be on the owner horse children page"

    assert.equal OwnerHorses.pageTitle, "Owner's Horses",
      "we should have the correct page title"

    assert.equal OwnerHorses.horses().count, 1,
      "we should have one horse"

    assert.ok (horse = OwnerHorses.horses 0)
    assert.equal horse.name, @horses[0].name,
      "the horse name should match"
