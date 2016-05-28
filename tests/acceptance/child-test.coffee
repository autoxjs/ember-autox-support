`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAcceptance from '../../tests/helpers/module-for-acceptance'`
`import ShowPage from 'dummy/tests/pages/dashboard/horse/index'`
`import OwnerPage from 'dummy/tests/pages/dashboard/horse/owner'`

moduleForAcceptance 'Acceptance: Child',
  beforeEach: ->
    @owner = server.create "owner"
    @horse = server.create "horse", owner: @owner.id
    server.db.owners.update @owner.id,
      horses: [@horse.id]

test 'visiting /child', (assert) ->
  ShowPage.visit(@horse)

  andThen =>
    assert.equal currentPath(), "dashboard.horse.index",
      "We should be on the right url"

    ShowPage.goOwner()

  andThen =>
    assert.equal currentPath(), "dashboard.horse.owner",
      "we should be on the owner"

    assert.equal OwnerPage.pageTitle, "Horse Owner",
      "the owner of this horse should be there"

    assert.equal OwnerPage.name, @owner.name,
      "the owner should match"

    OwnerPage.back()

  andThen ->
    assert.equal currentPath(), "dashboard.horse.index",
      "we should be back on the horse page"
