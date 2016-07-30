(require 'boot.repl)

(swap! boot.repl/*default-dependencies* conj
       '[cider/cider-nrepl "0.14.0-SNAPSHOT"]
       '[refactor-nrepl "2.3.0-SNAPSHOT"]
       '[acyclic/squiggly-clojure "0.1.6"])

(swap! boot.repl/*default-middleware* conj
       'cider.nrepl/cider-middleware
       'refactor-nrepl.middleware/wrap-refactor)
