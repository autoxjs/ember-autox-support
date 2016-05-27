import {
  create,
  visitable,
  text,
  clickable
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/dashboard/championship/:id'),
  horseId: text('li.display__horse-id'),
  name: text("li.display__name"),
  goHorse: clickable('a.xxx')
});
