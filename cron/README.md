# Cron README



Minute(0-59) Hour(0-24) Day_of_month(1-31) Month(1-12) Day_of_week(0-6) Command_to_execute


![cron-job-format](cron-job-format-1.png)

Commands
```bash
#For more details, check man pages.
man crontab
#To display the contents of the crontab file of the currently logged in user:
crontab -l

#To edit the current user’s cron jobs, do:
crontab -e

#To edit the crontab of a different user, for example <username>, do:
crontab -u <username> -e

#To run a cron job at every minute, the format should be like below.
#Check time format
* * * * * <command-to-execute>

#To remove all cron jobs for the current user:
crontab -r

```

# String formatting

We can also use the following strings to define job.
@reboot	Run once, at startup.
@yearly	Run once a year.
@annually	(same as @yearly).
@monthly	Run once a month.
@weekly	Run once a week.
@daily	Run once a day.
@midnight	(same as @daily).
@hourly	Run once an hour.


# Generating Cron commands

* https://crontab.guru/
* https://crontab-generator.org/

# Crontab -e vs /etc/cron.d

The differences are documented in detail in the cron(8) manpage in Debian. The main difference is that /etc/cron.d is populated with separate files, whereas
crontab manages one file per user; it’s thus easier to manage the contents of /etc/cron.d using scripts (for automated installation and updates), and
easier to manage crontab using an editor (for end users really).

Other important differences are that not all distributions support /etc/cron.d,
and that the files in /etc/cron.d have to meet a certain number of requirements (beyond being valid cron jobs):
they must be owned by root, and must conform to run-parts’ naming conventions (no dots, only letters, digits, underscores, and hyphens).

If you’re considering using /etc/cron.d, it’s usually worth considering one of /etc/cron.hourly, /etc/cron.daily, /etc/cron.weekly, or /etc/cron.monthly instead.

# References
* https://unix.stackexchange.com/questions/417323/what-is-the-difference-between-cron-d-as-in-etc-cron-d-and-crontab
* https://www.ostechnix.com/a-beginners-guide-to-cron-jobs/
