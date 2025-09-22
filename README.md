**Burnin – StressDisk Drive Burn-In Helper**

burnin is a Bash wrapper around StressDisk designed for safe and automated drive burn-in testing on Debian/Proxmox systems. It provides an interactive, user-friendly way to exercise new or suspect drives, capture SMART data, and generate health reports.

This script has been created, with the help of ChatGPT, to make StressDisk more useful in my homelab environment. It has a focus on safety, preventing a user from accidentally deleting data, and visibility to quickly undersand device health. 

Key Features

    Interactive drive selection

        Whiptail-based menu to pick target drives

        Skips RAID/ZFS/mounted disks by default (override with --force)

    Test modes

        verify (safe, default) – verify files only

        run (destructive) – write random files + verify

        cycle (destructive) – repeated fill/erase cycles

    Logging & reports

        SMART logs saved before and after testing

        Background temperature sampling (min/max per drive)

        Final summary report with colored health indicators

    Background or Foreground operation

        Background mode – de-prioritized jobs (ionice/nice), safe for multi-tasking

        Foreground mode – max resource usage with interactive progress gauge

    Control & management

        burnin status → show running jobs

        burnin list → map PIDs to drives with elapsed time

        burnin resume → live tail logs (all drives or specific)

        burnin stop → stop all jobs

        burnin clean → unmount & remove test data

        burnin report → generate SMART + temperature health report

    Safety first

        Global kill-switch confirmation

        Typed confirmation for destructive actions

        --dry mode simulates everything without touching disks
