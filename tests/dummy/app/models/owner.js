import attr from 'ember-data/attr';
import {hasMany} from 'ember-data/relationships';
import Model from 'ember-data/model';
import {action} from 'ember-annotative-models';

const purchaseHorse = action("click", {
  label: "Purchase a Horse",
  description: "Select a horse from the barn and make an offer to purchase him from his current owner",
  display: ["show"]
}, function*(){
  let {horse} = yield* action.need("horse");
  horse.set("owner", this);
  return horse.save().then(() => {
    return this.hasMany("horses").load();
  });
});
export default Model.extend({
  purchaseHorse,
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
