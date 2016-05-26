`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAcceptance from '../../tests/helpers/module-for-acceptance'`
`import ShowPage from 'dummy/tests/pages/dashboard/horse/index'`
`import EditPage from 'dummy/tests/pages/dashboard/horse/edit'`

moduleForAcceptance 'Acceptance: ModelEdit',
  beforeEach: ->
    @horse = server.create "horse"

test 'visiting /dashboard/horse/1', (assert) ->
  ShowPage.visit @horse
  andThen =>
    assert.equal currentPath(), 'dashboard.horse.index',
      'we should be at the right place'
    assert.equal ShowPage.id, @horse.id,
      "we should be on the page for the correct horse"
    ShowPage.goEdit()

  andThen ->
    assert.equal currentPath(), "dashboard.horse.edit",
      "we should land on the edit page"
    assert.equal EditPage.pageTitle, "Edit Horse",
      "we should have the right page title"
    EditPage.changeHorse("California Chrome", "Mustang")

  andThen =>
    assert.equal currentPath(), "dashboard.horse.index",
      "we should be redirected back to the show page"
    assert.equal ShowPage.name, "California Chrome",
      "the horse name should have changed"
    assert.equal ShowPage.breed, "Mustang",
      "the horse breed should also be correct"
    assert.equal ShowPage.id, @horse.id,
      "the we should still be referring to the same horse"
