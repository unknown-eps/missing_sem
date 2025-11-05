#!/bin/bash
foo="bar"
echo "Foo has value $foo" # Substitution of foo will take place.
# shellcheck disable=SC2016
echo 'Foo has value $foo' # No substituion will take place.

# Spaces are very important in bash.