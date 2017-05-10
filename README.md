## WordPress Login Brute Force ##

This a little script realized with Perl impact over WordPress system that don't have WAF/IDS 

### Dependence

* Perl
* WWW::Mechanize `http://search.cpan.org/~oalders/WWW-Mechanize/lib/WWW/Mechanize.pm`

### Preparate Workspace

Install WWW::Mechanize on linux system

* `$ sudo cpan WWW::Mechanize`
* Enjoy script.

Install WWW::Mechanize on windows system

* Open CMD of POWERSHELL
* cd C:\'perlroute'\bin\cpan.exe
* `cpan> install WWW::Mechanize`
* Enjoy Script.

### Note: Over Windows system for use perl you can download `http://strawberryperl.com/` or `https://www.activestate.com/activeperl` ###

### How to use

This script need 2 parameters 

+ URL : Target url `http://sitewordpress/wp-login.php`
+ ADMIN : Ditcionary or file of usernames list to probe.
+ PASSWORD : Dictionary or file of password list to probe.
+ REPORT : It is a file containing the username and password found.

### Example

`$ BF_wordpress.pl http://wordpress/wp-login.pjp user.txt password.txt `


