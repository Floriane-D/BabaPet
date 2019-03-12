import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "Congratulations!",
  text: "Your booking has just been made",
  icon: "success"
  }, (value) => {
    if (value) {
      const link = document.querySelector('#make-booking');
      link.click();
    }
  }
);

