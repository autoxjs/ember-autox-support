import {
  create,
  visitable,
  clickable,
  text
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/dashboard/horse/:id'),
  pageTitle: text('h1.page-title'),
  modelName: text('li.display__factory'),
  id: text('li.display__id'),
  name: text('li.display__name'),
  breed: text('li.display__breed'),
  goEdit: clickable('a[href$="edit"]'),
  goChampionships: clickable('a[href$="championships"]'),
  goOwner: clickable('a.belongs-to')
});
