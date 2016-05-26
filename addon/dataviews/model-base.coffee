`import Ember from 'ember'`
`import Dataview from 'ember-dataview'`
`import DataviewBase from '../mixins/dataview-base'`

ModelBaseDataview = Dataview.extend DataviewBase,
  loads:
    record: ({model}) -> model

`export default ModelBaseDataview`
