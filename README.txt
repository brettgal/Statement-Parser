***********************************
Kyle Krueger | Brett Gallagher 
cssc0413 | cssc0423
San Diego State University
CS 530 Spring 2022
Professor Guy Leonard
Assignment 3
***********************************
***********************************
BNF GRAMMAR
***********************************

<ass>		::= <id>=<exp>
<exp>		::=<id><op><id>|<exp><op><id>|(<exp>)
<id>		::= <char>|<id><char>|<id><digit>
<char>		::= a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x| 
           	    y|z|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V| 
           	    W|X|Y|Z 
<digit>		::= 0|1|2|3|4|5|6|7|8|9 
<op>		::= +|-|*|/|%

************************************
FILES IN PROJECT
************************************
Makefile
README
flex.l
bison.y
************************************
COMPILE INSTRUCTIONS
To generate the necessary header file before being able to use the makefile, type "flex --header-file=flex.h flex.l"
After this is generated, the program will compile properly with "make"
************************************
OPERATING INSTRUCTIONS
After compiling the program, use the command "./parser" and then the text file you want to parse as the next argument.
************************************
ISSUES
We ran into an issue in our bison file where instances of consecutive OPs led to incorrect output. We resolved this by adding in the opop grammar rule for error detection.
Our other issue we ran into was two main functions, we resolved this by renaming the main in flex.l.
************************************
LESSONS LEARNED
Learned about flex and bison and how they interact with each other. Learned more about regular expressions. Learned about BNF Grammar.
************************************