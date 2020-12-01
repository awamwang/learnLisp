(defun compress (x)
  (if (consp x)
      (compr (car x) 1 (cdr x))
      x))

(defun compr (elt n lst)
  (if (null lst)
      (list (n-elts elt n))
      (let ((next (car lst)))
        (if (eql next elt)
            (compr elt (+ n 1) (cdr lst))
            (cons (n-elts elt n)
                  (compr next 1 (cdr lst)))))))

(defun n-elts (elt n)
  (if (> n 1)
      (list n elt)
      elt))

;; (defun de-n-elts (n elt)
;;   (
;;     if (eql n 1) 
;;       (list elt)
;;       (cons elt (de-n-elts (- n 1) elt))
;;   ))

;; ;; (format t "~A~%" (de-n-elts 6 1))

;; (defun uncompr-elt (elt)
;;   (
;;     if (consp elt)
;;       (de-n-elts (car elt) (second elt))
;;       (list elt)
;;   ))

;; ;; (format t "~A~%" (uncompr-elt '(6 1)))

;; (defun uncompress (x)
;;   (if (consp x)
;;     (uncompr (car x) (cdr x))
;;     x))

;; (defun uncompr (elt lst)
;;   (progn
;;     (format t "~A;;~A~%" elt lst)
;;     (if (null lst)
;;       (uncompr-elt elt)
;;       (append (uncompr-elt elt) (uncompress lst)))
;;   ))

(defun uncompress (lst)
  (if (null lst)
      nil
      (let ((elt (car lst))
            (rest (uncompress (cdr lst))))
        (if (consp elt)
            (append (apply #'list-of elt)
                    rest)
            (cons elt rest)))))

(defun list-of (n elt)
  (if (zerop n)
      nil
      (cons elt (list-of (- n 1) elt))))