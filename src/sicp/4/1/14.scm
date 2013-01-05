;; Louis has installed the system version of map as a primitive for the
;; metacircular evaluator. When he tries it, things go terribly wrong.
;;
;; Louis is mixing interpreted language with native language of the interpreter.
;; His 'map' procedure expects a procedure in native language but receives a
;; procedure in interpreted language.
