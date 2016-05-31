`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAcceptance from '../../tests/helpers/module-for-acceptance'`
{RSVP, typeOf} = Ember
moduleForAcceptance 'Acceptance: Relationship',
  beforeEach: ->
    @horse = server.create "horse"
    @owner = server.create "owner"
    @store = @application.__container__.lookup("service:store")

test 'mirage relationship saves', (assert) ->
  visit "/"
  andThen =>
    RSVP.hash
      horse: @store.findRecord "horse", @horse.id
      owner: @store.findRecord "owner", @owner.id
    .then ({horse, owner}) ->
      ownerRef = horse.belongsTo("owner")
      horsesRef = owner.hasMany("horses")

      assert.equal typeOf(ownerRef.id), 'function',
        "should have an id function"
      assert.equal typeOf(horsesRef.push), 'function',
        "should have a push function"
      assert.notOk horsesRef.value(),
        "the horses should not yet be loaded"

      horse.set "owner", owner
      horse.save()
      .then ->
        assert.ok horse.get("owner.id"), "we should have an id"
        assert.equal horse.get("owner.id"), owner.get("id"),
          "the horse should have the right owner"
        horsesRef.load()
      .then (horses) ->
        assert.equal horses.get("length"), 1,
          "we should have a horse"
        firstHorse = horses.get("firstObject")
        assert.equal firstHorse.get("id"), horse.get("id"),
          "it should be the correct horse"
