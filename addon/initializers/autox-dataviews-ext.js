import AutoxBaseDataview from '../dataviews/autox-base';
import DataviewsService from 'ember-dataview/services/dataviews';
export function initialize(/* application */) {
  DataviewsService.reopen({
    defaultViewFactory: AutoxBaseDataview
  });
}

export default {
  name: 'autox-dataviews-ext',
  initialize
};
