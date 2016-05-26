`import AutoxRouteBase from '../mixins/autox-route-base'`
`import AutoxRouteForm from '../mixins/autox-route-form'`
`import AutoxRouteModel from '../mixins/autox-route-model'`
`import AutoxRouteCollection from '../mixins/autox-route-collection'`
Standardx =
  collection:
    routeMixins: [AutoxRouteBase, AutoxRouteCollection]
  model:
    routeMixins: [AutoxRouteBase, AutoxRouteModel]
  children:
    routeMixins: [AutoxRouteBase, AutoxRouteCollection]
  child:
    routeMixins: [AutoxRouteBase, AutoxRouteModel]
  view:
    routeMixins: [AutoxRouteBase]
  form:
    routeMixins: [AutoxRouteBase, AutoxRouteForm]

`export default Standardx`
