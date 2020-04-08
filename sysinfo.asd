;;don't edit
(defsystem "sysinfo"
  :depends-on((:feature :linux "sysinfo/linux")
              (:feature :windows "sysinfo/windows")
              (:feature :darwin "sysinfo/darwin"))
  :class :package-inferred-system
  :author "SANO Masatoshi"
  :mailto "snmsts@gmail.com")
