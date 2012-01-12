;; Yes, this is a safe change to make.

;; There is no difference in what concurrency is allowed
;; by these two versions of make-account. This is because
;; the work of serializer is done on procedure invocation
;; and not on procedure creation.