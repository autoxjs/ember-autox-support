import Ember from 'ember';
const {A} = Ember;
export default function(server) {

  // Seed your development database using your factories. This
  // data will not be loaded in your tests.

  const owner = server.createList('owner', 1);
  const horses = server.createList('horse', 10, {
    owner_id: owner.id
  });
  const [horse] = horses;
  const championships = server.createList('championship', 5, {
    horse_id: horse.id
  });
  server.db.owners.update(owner.id, {
    horses: A(horses).mapBy("id")
  });
  server.db.horses.update(horse.id, {
    championships: A(championships).mapBy("id")
  });
}
