(define-macro (with-var binding . body)
  `(let (,binding)
     ,@body
     (display ',binding)
     (newline)
     (display ',(car binding))
     (newline)))

(define-macro (with-vars bindings . body)
  ;`(let () (display (list "bindings:" ',bindings "body:" ',body)) (newline)))
  (if (pair? bindings)
      (if (pair? (cdr bindings))
          `(with-var ,(car bindings) 
                     (with-vars ,(cdr bindings) ,@body))
          `(with-var ,(car bindings)
                     ,@body))
      `(let () ,@body)))

(with-var (a-var 23)
          (display a-var)
          (newline)
          (display "Hello!")
          (newline))

(newline)
(newline)

(with-vars ((a-var 23)
            (b-var 778))
            (display (list a-var "and" b-var))
            (newline)
            (display "Hello!")
            (newline))
