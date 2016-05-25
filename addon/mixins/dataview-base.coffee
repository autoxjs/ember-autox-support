`import Ember from 'ember'`

{computed: {alias}} = Ember
DataviewBaseMixin = Ember.Mixin.create
  record: alias "model.record"
  records: alias "model.records"
  fields: alias "model.fields"
  metadata: alias "model.metadata"

`export default DataviewBaseMixin`
