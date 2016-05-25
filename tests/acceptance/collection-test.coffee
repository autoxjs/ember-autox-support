`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAcceptance from '../../tests/helpers/module-for-acceptance'`
`import IndexPage from 'dummy/tests/pages/dashboard/horses/index'`
`import ShowPage from 'dummy/tests/pages/dashboard/horse/index'`

moduleForAcceptance 'Acceptance: Collection'

test 'visiting /dashboard/horses', (assert) ->
  horses = server.createList("horse", 10)

  assert.equal horses.length, 10,
    "we should have created 10 horses"

  IndexPage.visit()
  andThen ->
    assert.equal IndexPage.pageTitle, "Horses",
      "we should have the proper page title"
    assert.equal currentURL(), '/dashboard/horses',
      "we should be on the right page"
    assert.equal IndexPage.horses().count, "10",
      "we should have 10 horses"
    for i in [0..9]
      assert.ok IndexPage.horses(i).name, "the horse at position #{i} should have a name"
      assert.ok IndexPage.horses(i).breed, "the horse at position #{i} should have a breed"

    assert.equal IndexPage.fields().count, 3,
      "we should have 3 fields"

    assert.equal IndexPage.fields(0).name, "id",
      "the first field should be id"

    assert.equal IndexPage.fields(1).name, "name",
      "the second field should be name"

    assert.equal IndexPage.fields(2).name, "breed",
      "the final field should be breed"

    IndexPage.horses(0).click()

  andThen ->
    assert.equal currentURL(), "/dashboard/horse/1",
      "we should land on the horse show page"
    assert.equal ShowPage.pageTitle, "Show Horse",
      "we should have the right title"
