# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.0.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# above are defaults
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.14.0/modular/sortable.esm.js"
pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.9/dist/flatpickr.js"
pin "stimulus-flatpickr", to: "https://ga.jspm.io/npm:stimulus-flatpickr@3.0.0-0/dist/index.m.js"
pin "stimulus", to: "https://ga.jspm.io/npm:stimulus@3.0.1/dist/stimulus.js"
pin "@zxing/library", to: "https://ga.jspm.io/npm:@zxing/library@0.19.1/esm/index.js"
pin "ts-custom-error", to: "https://ga.jspm.io/npm:ts-custom-error@3.2.0/dist/custom-error.js"
pin "axios", to: "https://ga.jspm.io/npm:axios@0.21.4/index.js"
pin "#lib/adapters/http.js", to: "https://ga.jspm.io/npm:axios@0.21.4/lib/adapters/xhr.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/process-production.js"
