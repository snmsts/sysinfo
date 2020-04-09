(uiop/package:define-package :sysinfo/darwin (:nicknames) (:use :cl) (:shadow)
  (:import-from :sysinfo/posix :system :os :arch
   :kernel-version)
  (:export :os :arch :kernel-version :product :build) (:intern))
(in-package :sysinfo/darwin)
;;don't edit above

(defun product ()
  "-> 10.15"
  (string-trim (format nil "~%")
               (system "sw_vers -productVersion")))

(defun build ()
  "-> 19A583"
  (string-trim (format nil "~%")
               (system "sw_vers -buildVersion")))
