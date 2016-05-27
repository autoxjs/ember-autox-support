`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAcceptance from '../../tests/helpers/module-for-acceptance'`
`import NewPage from 'dummy/tests/pages/dashboard/horse/championships/new'`
`import ShowPage from 'dummy/tests/pages/dashboard/championship/index'`
moduleForAcceptance 'Acceptance: ChildrenNew',
  beforeEach: ->
    @horse = server.create "horse"

test 'visiting children-new', (assert) ->
  NewPage.visit @horse
  horseId = null
  andThen ->
    assert.equal currentPath(), 'dashboard.horse.championships.new',
      'we should be on the right page'

    NewPage.name("top-secret-mega-bowl").submit()

  andThen ->
    assert.equal currentPath(), 'dashboard.championship.index',
      'we should be redirected to the championship page'

    assert.equal ShowPage.name, 'top-secret-mega-bowl',
      'we should have the proper championship name'

    assert.ok (horseId = ShowPage.horseId), "we should have a id"
    ShowPage.goHorse()

  andThen =>
    assert.equal currentPath(), 'dashboard.horse.index',
      'we should be on the right page'
    assert.ok @horse.id,
      'we should have a horse id'
    assert.equal @horse.id, horseId,
      "we should have the correct horse id"
