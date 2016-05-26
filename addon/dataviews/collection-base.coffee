`import Dataview from 'ember-dataview'`
`import DataviewBase from '../mixins/dataview-base'`

CollectionBaseDataview = Dataview.extend DataviewBase,
  loads:
    records: ({model}) -> model

`export default CollectionBaseDataview`
