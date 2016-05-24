`import DS from 'ember-data'`

Horse = DS.Model.extend
  name: DS.attr "string",
    label: "Horse Name"
    description: "A horse's name is usually a very fanciful bunch of words"
    display: ["show", "index"]
    modify: ["new"]
  breed: DS.attr "string",
    label: "Horse Breed"
    description: "Horses hail from all the over the world and, through-out history, have been bred for different things"
    among: ["arabian", "andalusian", "mustang", "shire", "clyesdale"]
    display: ["show", "index"]
    modify: ["new"]

`export default Horse`
