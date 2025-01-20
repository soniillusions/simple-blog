// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"

import 'bootstrap/js/dist/collapse'
import Lightbox from 'bs5-lightbox'

import { Application } from "@hotwired/stimulus";
import TomSelectController from "./controllers/tom_select_controller";

const application = Application.start();
application.register("tom-select", TomSelectController);

document.querySelectorAll('.my-lightbox-toggle').forEach(el => el.addEventListener('click', Lightbox.initialize))

import "@hotwired/turbo-rails"