import { test } from 'qunit';
import moduleForAcceptance from '../../tests/helpers/module-for-acceptance';
import ShowPage from 'dummy/tests/pages/dashboard/horse/index';
import IndexPage from 'dummy/tests/pages/dashboard/horse/championships/index';
moduleForAcceptance('Acceptance | children');

test('visiting /children', function(assert) {
  let horse = server.create("horse");
  let championships = server.createList("championship", 10, {horse_id: horse.id});
  server.db.horses.update(horse.id, {
    championships: championships.map(({id}) => { return id; })
  });
  ShowPage.visit(horse);

  andThen(function() {
    assert.equal(currentPath(), 'dashboard.horse.index',
      "we should land on the right page");

    ShowPage.goChampionships();
  });

  andThen(function() {
    assert.equal(currentPath(), 'dashboard.horse.championships.index',
      'we should be on the horse champsionship page');
    assert.equal(IndexPage.pageTitle, 'Horse Championships',
      'We should have the correct page title');
    assert.equal(IndexPage.championships().count, 10,
      'we should have 10 champsionships');
    IndexPage.championships(0).go();
  });

  andThen(function() {
    assert.equal(currentPath(), 'dashboard.championship.index');
  });
});
