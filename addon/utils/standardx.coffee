`import AutoxRouteBase from '../mixins/autox-route-base'`
`import AutoxRouteForm from '../mixins/autox-route-form'`
`import AutoxRouteModel from '../mixins/autox-route-model'`
`import AutoxRouteCollection from '../mixins/autox-route-collection'`
`import AutoxActionSupport from '../mixins/autox-action-support'`

Standardx =
  collection:
    routeMixins: [AutoxRouteBase, AutoxRouteCollection]
  model:
    routeMixins: [AutoxRouteBase, AutoxRouteModel]
    controllerMixins: [AutoxActionSupport]
  children:
    routeMixins: [AutoxRouteBase, AutoxRouteCollection]
  child:
    routeMixins: [AutoxRouteBase, AutoxRouteModel]
    controllerMixins: [AutoxActionSupport]
  view:
    routeMixins: [AutoxRouteBase]
  form:
    routeMixins: [AutoxRouteBase, AutoxRouteForm]

`export default Standardx`
