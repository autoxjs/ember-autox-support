import {
  create,
  visitable,
  text,
  clickable
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/dashboard/horse/:id/owner'),
  pageTitle: text('h1.page-title'),
  name: text('li.display__name'),
  back: clickable('a.back')
});
