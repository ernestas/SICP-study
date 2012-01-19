;; Alyssa P. Hacker replies that this version of the procedure is considerably
;; less efficient because it performs redundant computation. It doesn't continue
;; to work on the same stream. It calls itself recursively to calculate next
;; value. Thus losing all the benefits of the delay optimization and being equal
;; in efficiency with unoptimized delay procedure.
