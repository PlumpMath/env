(require 'boot.repl)

(swap! boot.repl/*default-dependencies* conj
       '[acyclic/squiggly-clojure "0.1.6"])
