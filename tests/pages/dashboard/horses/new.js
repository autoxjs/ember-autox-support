import {
  create,
  visitable,
  fillable,
  clickable,
  text
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/dashboard/horses/new'),
  name: fillable("[name=name]"),
  breed: fillable("[name=breed]"),
  submit: clickable("[type=submit]"),
  modelName: text("li.display__factory"),
  createHorse(name, breed) {
    return this.name(name).breed(breed).submit();
  }
});
