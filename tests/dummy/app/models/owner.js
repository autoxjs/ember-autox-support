import attr from 'ember-data/attr';
import {hasMany} from 'ember-data/relationships';
import Model from 'ember-data/model';

export default Model.extend({
  name: attr("string", {
    label: "Owner Name",
    description: "The name of the person or corporation",
    display: ["show", "index"],
    modify: ["edit", "new"]
  }),
  horses: hasMany("horse", {
    label: "Horses",
    description: "The horses owned by this person or corporation",
    async: true
  })
});
