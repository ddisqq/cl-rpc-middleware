;;;; cl-rpc-middleware.asd - JSON-RPC middleware pipeline system
;;;;
;;;; BSD-3-Clause License
;;;; Copyright (c) 2024, CLPIC Contributors

(asdf:defsystem #:cl-rpc-middleware
  :description "JSON-RPC middleware pipeline for request/response transformation"
  :author "CLPIC Contributors"
  :license "BSD-3-Clause"
  :version "1.0.0"
  :serial t
  :depends-on ()
  :components ((:file "package")
               (:module "src"
                :serial t
                :components ((:file "types")
                             (:file "chain")
                             (:file "auth")
                             (:file "rate-limit")
                             (:file "cache")
                             (:file "logging")
                             (:file "validation")
                             (:file "cors")
                             (:file "compression")
                             (:file "metrics")
                             (:file "error-handling")
                             (:file "tracing"))))
  :in-order-to ((test-op (test-op #:cl-rpc-middleware/test))))

(asdf:defsystem #:cl-rpc-middleware/test
  :description "Tests for cl-rpc-middleware"
  :depends-on (#:cl-rpc-middleware)
  :serial t
  :components ((:module "test"
                :serial t
                :components ((:file "package")
                             (:file "suite"))))
  :perform (test-op (o c)
             (uiop:symbol-call :cl-rpc-middleware/test :run-tests)))
