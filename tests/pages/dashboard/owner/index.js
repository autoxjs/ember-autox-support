import {
  create,
  visitable,
  text,
  clickable
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/dashboard/owner/:id'),
  pageTitle: text('h1.page-title'),
  name: text('li.display__name'),
  purchaseHorse: clickable('button.action__purchaseHorse'),
  gotoHorses: clickable('a.my-horses')
});
