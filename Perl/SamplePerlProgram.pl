#!/usr/bin/perl

use warnings;

print "A Basic Perl Program\n";

# Variables
$var = 10;
print "Variable var = $var\n\n";

# Array
@array = (1,2,3,4,5);
print "Array Of Elements: @array\n\n";

# Scalar Operations
$str = "abc" . "def";
print "Concatenated String: $str\n\n";

# Arithmetic Operations
$num1 = 10;
$num2 = 20;

print "num1: 10  num2: 20\n";
print "Sum: ", $num1 + $num2, "\n";
print "Difference: ", $num1 - $num2, "\n";
print "Product: ", $num1 * $num2, "\n";
print "Quotient: ", $num1 / $num2, "\n";
print "Remainder: ", $num1 % $num2, "\n\n";

# Multiline Strings
$multiline = "first line
second line
third line";
print "Multiline String: $multiline\n";