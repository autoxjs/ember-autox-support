import {
  create,
  visitable,
  fillable,
  clickable
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/dashboard/horse/:id/championships/new'),
  name: fillable("[name=name]"),
  submit: clickable("[type=submit]")
});
