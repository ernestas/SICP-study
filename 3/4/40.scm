;; without serializer:
;; 1,000,000 100,000 10,000 1,000 and 100

;; with serializer:
;; 1,000,000: P1 sets x to   100 and then P2 sets x to 1,000,000
;; 1,000,000: P2 sets x to 1,000 and then p1 sets x to 1,000,000
