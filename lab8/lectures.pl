#!/usr/bin/perl -w

# given course codes as arguments prints details of their lectures.
# Aidan Barrington UNSW COMP2041 2013 S2

use strict;
use warnings;

my $base_url = "http://www.timetable.unsw.edu.au/2013/";

die "Usage: $0 Four-character UNSW course code"
	if ((!@ARGV) or ($ARGV[0] !~ /^[a-z]{4}[0-9]{4}$/i));

foreach (@ARGV) {
	
	my $course_code = $_;
	$course_code =~ tr/[a-z]/[A-Z]/;

	my $url = $base_url;
	$url .= $course_code;
	$url .= ".html";

	print "Checking for lectures for $course_code...\n";
	print "Scanning $url\n";

	open F, "wget -q -O- $url|" or die "could not open website";

	while (<F>) {
		
		#next if $_ !~ /[0-9]\/[0-9]/;

		if ($_ =~ /"Semester"/i) {
			print "Semester: $_";
		}

		#print;
	}

}