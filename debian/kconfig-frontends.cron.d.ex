#
# Regular cron jobs for the kconfig-frontends package
#
0 4	* * *	root	[ -x /usr/bin/kconfig-frontends_maintenance ] && /usr/bin/kconfig-frontends_maintenance
