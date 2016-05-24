`import Ember from 'ember'`
`import Dataview from 'ember-dataview'`
`import loadFields from '../utils/load-fields'`
`import DataviewBase from '../mixins/dataview-base'`
{RSVP} = Ember
ModelBaseDataview = Dataview.extend DataviewBase,
  loads:
    model: (metadata) ->
      RSVP.hash
        fields: loadFields(@get("store"), metadata.original, metadata)
        record: RSVP.resolve metadata.original
        metadata: RSVP.resolve metadata

`export default ModelBaseDataview`
