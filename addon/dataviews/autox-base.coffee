`import Dataview from 'ember-dataview'`
`import loadFields from '../utils/load-fields'`

AutoxBaseDataview = Dataview.extend
  loads:
    fields: (metadata) ->
      loadFields(@get("store"), metadata.model, metadata)
    metadata: (data) -> data
    records: ({model}) -> model
    record: ({model}) -> model

`export default AutoxBaseDataview`
