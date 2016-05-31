`import DS from 'ember-data'`
`import {Multiaction} from 'ember-annotative-models'`

Horse = DS.Model.extend Multiaction,
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

  owner: DS.belongsTo "owner",
    label: "Owner"
    description: "The person or corporation which owns this horse"
    async: true

  championships: DS.hasMany "championship",
    label: "Victorious Championships"
    description: "The races where this horse has taken first place"
    async: true

`export default Horse`
