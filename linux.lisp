(uiop/package:define-package :sysinfo/linux (:nicknames) (:use :cl) (:shadow)
                             (:import-from :sysinfo/posix) (:export) (:intern))
(in-package :sysinfo/linux)
;;don't edit above

;; import from posix
;; arch
;; os
;; kernel-version

;; tbd functions
;; dist type
;; dist version
;; libc type
;; libc version

#|
#ifdef HAVE_GNU_LIBC_VERSION_H
      printf("%s\n",gnu_get_libc_version());
#endif
|#
