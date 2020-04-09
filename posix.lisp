(uiop/package:define-package :sysinfo/posix (:nicknames) (:use :cl) (:shadow)
                             (:export :arch :os :kernel-version :system) (:intern))
(in-package :sysinfo/posix)
;;don't edit above

(defun system (command)
  (uiop:run-program command :output :string))

(defvar *os* nil)
(defun os () 
  (if *os*
      *os*
      (setf *os* (string-downcase (string-trim (format nil "~%") (system "uname -s")))
            *os* (if (eql *os* "sunos")
                     "solaris"
                     *os*))))
(defvar *arch* nil)
(defun arch ()
  (if *arch*
      *arch*
      (setf *arch* (string-downcase (string-trim (format nil "~%") (system "uname -m")))
            *arch* (cond ((member *arch* '("i86pc" "amd64") :test 'equal) "x86-64")
                         ((member *arch* '("i686" "i386") :test 'equal) "x86")
                         ((member *arch* '("aarch64") :test 'equal) "arm64")
                         ((member *arch* '("armv6l" "armv7l"):test 'equal)
                          (if (equal "0"(system "readelf -A /proc/self/exe |grep Tag_ABI_VFP_args|wc -l"))
                              "armhf"
                              "armel"))
                         ((member *arch* '("armv5tejl") :test 'equal) "armel")
                         (t (substitute #\- #\_ *arch*))))))

(defvar *kernel-version* nil)
(defun kernel-version ()
  (if *kernel-version*
      *kernel-version*
      (setf *kernel-version* (string-trim (format nil "~%") (system "uname -r")))))

