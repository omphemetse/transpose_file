#!/bin/bash

filename='file.txt' # Source file consisting of the line values that need to be transposed
n=1 # Counter used to determine the number of lines being read

# Declare two array that will be used to extract the first and second lines of the transposed output
declare -a odd_array
declare -a even_array

# Read file lines with a while loop
while read line; 
do
	x=1 # Counter used to determine if number even or odd
	IFS=' ' # space is set as delimiter

	# $line is used to hold the line value being read from the file
	read -ra ADDR <<< "$line" # line is read into an array as tokens separated by IFS
	for i in "${ADDR[@]}"; do # access each element of array

		# Check if count is odd or even
		if [ $((x%2)) -eq 0 ]
		then
			# Grab values to be used in the first line of final output and add them to an array index
  			eval even_array[$n]=$i
		else
			# Grab values to be used in the second line of final output and add them to an array index
  			eval odd_array[$n]=$i
		fi

		# Increment count
  		x=$((x+1))
	done

	# Increment count
	n=$((n+1))
done < $filename

# Expand to the arguments merged into one argument
echo ${odd_array[*]}

# Expand each element as a separate argument
# echo ${odd_array[@]}
echo ${even_array[@]}
