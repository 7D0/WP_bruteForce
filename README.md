## WordPress Login Brute Force ##

This a little script realized with Perl impact over WordPress system that don't have WAF/IDS 

### How to use

This script need 2 parameters 

+ <URL> : Target url `http://sitewordpress/wp-login.php`
+ <ADMIN> : Ditcionary or file of usernames list to probe.
+ <PASSWORD> : Dictionary or file of password list to probe.
+ <REPORT> : It is a file containing the username and password found.

### Example

`$ BF_wordpress.pl http://wordpress/wp-login.pjp user.txt password.txt `
