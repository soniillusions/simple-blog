import { Controller } from "@hotwired/stimulus";
import TomSelect from "tom-select";

export default class extends Controller {
    static values = {
        ajaxUrl: String,
    }

    connect() {
        const opts = {
            plugins: {
                remove_button: {},
                no_backspace_delete: {},
                restore_on_backspace: {},
            },
            valueField: "id",
            labelField: "title",
            searchField: "title",
            create: false,
            load: (query, callback) => {
                const url = `${this.ajaxUrlValue}.json?term=${encodeURIComponent(query)}`;
                fetch(url)
                    .then((response) => response.json())
                    .then((json) => callback(json))
                    .catch(() => callback());
            },
        };

        this.select = new TomSelect(this.element, opts);
    }

    disconnect() {
        if (this.select) {
            this.select.destroy();
            this.select = null;
        }
    }
}
