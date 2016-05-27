import {
  create,
  visitable,
  collection,
  clickable,
  text
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/horse/:id/championships'),
  pageTitle: text("h1.page-title"),
  championships: collection({
    itemScope: "ul.championships li",
    item: {
      id: text("span", {at: 0}),
      name: text("span", {at: 1}),
      go: clickable("a")
    }
  })
});
