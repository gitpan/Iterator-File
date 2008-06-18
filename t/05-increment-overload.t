#!/usr/bin/perl

use strict;
use warnings;

use IO::Scalar;

#use Test::More 'tests' => 5;
use Test::More 'no_plan';
require 't/util.pl';

my $data = '';
my $fh = new IO::Scalar \$data;

BEGIN {
  use_ok( "Iterator::File" );
};


{
  $data = '';
  my $file = 't/data/three_lines.txt';

  my $i = iterator_file( $file );
  $i->next();
  print $fh "Test: $i :tseT";

 is($fh, "Test: this is the first line :tseT", "as_string overload");
}



{
  my $file = 't/data/three_lines.txt'; 
  my $expected = slurp( $file );
  
  my $i = iterator_file( $file,
                         'chomp' => 0 );

  my $actual = "";
  while ($i++) {
      $actual .= $i->value();
  }
  
  is( $actual, $expected, "overload_add");
}


