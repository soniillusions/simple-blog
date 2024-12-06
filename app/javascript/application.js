// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"
import Rails from "@rails/ujs";

import 'bootstrap/js/dist/collapse'
import Lightbox from 'bs5-lightbox';

document.querySelectorAll('.my-lightbox-toggle').forEach(el => el.addEventListener('click', Lightbox.initialize));

Rails.start();


