;; Explicit dispatch
;;
;; For every new type or operation the code will have to be altered.

;; Data-directed dispatch (operations dispatch on data type)
;;
;; New operations can be added additively, by installing a package.
;; New types will require code to be altered in all operations.

;; Message-passing (data objects/types dispatch on operation name)
;;
;; New types can be added additively, by defining new data type(procedure).
;; New operations will require code to be altered in all data types.


;; If new types must often be added, message-passing style is most appropriate.
;; If new operations must often be added, data-directed style is most appropriate.