import {
  create,
  visitable,
  text,
  collection,
  clickable
} from 'ember-cli-page-object';

export default create({
  visit: visitable('/'),
  pageTitle: text('h1.page-title'),
  horses: collection({
    itemScope: "ul.horses li",
    item: {
      modelName: text("span", {at: 0}),
      name: text("span", {at: 1}),
      breed: text("span", {at: 2}),
      click: clickable("a")
    }
  })
});
