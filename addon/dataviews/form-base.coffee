`import Dataview from 'ember-dataview'`
`import DataviewBase from '../mixins/dataview-base'`

NewBaseDataview = Dataview.extend DataviewBase,
  loads:
    record: ({model}) -> model

`export default NewBaseDataview`
