; C - center
; T - tolerance
;
; a = [Ca - (0.5 * Ca * Ta), Ca + (0.5 * Ca * Ta)]
; a = [Ca * (1 - 0.5 * Ta), Ca * (1 + 0.5 * Ta)]
; b = [Cb * (1 - 0.5 * Tb), Cb * (1 + 0.5 * Tb)]
;
; since all numbers are positive
; a * b = [(Ca * (1 - 0.5 * Ta)) * (Cb * (1 - 0.5 * Tb)),
;          (Ca * (1 + 0.5 * Ta)) * (Cb * (1 + 0.5 * Tb))]
;
; a * b = [Ca * Cb * (1 - 0.5 * (Ta + Tb)) + (0.25 * Ta * Tb),
;          Ca * Cb * (1 + 0.5 * (Ta + Tb)) + (0.25 * Ta * Tb)]
;
; Ta & Tb are negligible
; approximate percentage tolerance of the product of two intervals
; is the sum of the tolerances of the factors
