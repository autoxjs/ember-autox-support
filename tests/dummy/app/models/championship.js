import attr from 'ember-data/attr';
import {belongsTo} from 'ember-data/relationships';
import Model from 'ember-data/model';

export default Model.extend({
  name: attr("string", {
    label: "Competition Name",
    description: "The name of the competition"
  }),
  horse: belongsTo("horse", {
    label: "Victorious Horse",
    description: "The name of the horse who was victorious at this championship",
    async: true
  })
});
