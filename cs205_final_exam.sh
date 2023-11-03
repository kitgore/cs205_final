#!/bin/bash
# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

# Name of the file
data_file="$1"

awk -F'\t' ' 
    # for every line after the first to skip the header
    NR>1 {
        # incrememnt the total count
        totalPokemon++;
        
        # add to the total hp
        totalHP+=$6;
        
        add to the total attack
        totalAttack+=$7;
    }
    # after processing all lines, print the report
    END {
        # print header and file
        print "===== SUMMARY OF DATA FILE ====="
        print "   File name:", FILENAME
        
        # print total
        print "   Total Pokemon:", totalPokemon
        
        # calculate and print the average hp
        print "   Avg. HP:", totalHP/totalPokemon
        
        # calculate and print the average attack
        print "   Avg. Attack:", totalAttack/totalPokemon
        
        # print footer
        print "===== END SUMMARY ====="
    }' $data_file
    # Pass the file to read to awk