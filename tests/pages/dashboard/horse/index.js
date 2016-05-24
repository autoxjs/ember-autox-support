import {
  create,
  visitable,
  text
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/dashboard/horses/:id'),
  pageTitle: text('h1.page-title'),
  modelName: text('li.display__factory'),
  name: text('li.display__name'),
  breed: text('li.display__breed')
});
