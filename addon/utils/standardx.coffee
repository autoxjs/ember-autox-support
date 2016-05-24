`import AutoxRouteBase from '../mixins/autox-route-base'`
`import AutoxRouteForm from '../mixins/autox-route-form'`
`import AutoxRouteModel from '../mixins/autox-route-model'`
Standardx =
  collection:
    routeMixins: [AutoxRouteBase]
  model:
    routeMixins: [AutoxRouteBase, AutoxRouteModel]
  children:
    routeMixins: [AutoxRouteBase]
  child:
    routeMixins: [AutoxRouteBase]
  view:
    routeMixins: [AutoxRouteBase]
  form:
    routeMixins: [AutoxRouteBase, AutoxRouteForm]

`export default Standardx`
