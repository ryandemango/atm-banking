#!/bin/csh
#CS2600 Project 3
#Ryan Mangilin
echo "Please enter the phonebook file name: "
set phonebook = $< #reads file name
set file = $phonebook
cat $file > temp.txt
set temp = temp.txt
set stop = 0
while ( $stop == 0 ) #reprompts menu
    clear
    echo "(1) List of records in First Name alphabetical order"
    echo "(2) List of records in Last Name alphabetical order"
    echo "(3) List of records in reverse First Name alphabetical order"
    echo "(4) List of records in reverse Last Name alphabetical order"
    echo "(5) Search for a record by Last Name"
    echo "(6) Search for a record by Birthday"
    echo "(7) Insert Record"
    echo "(8) Delete Record"
    echo "(9) Exit"
    echo "Please choose an option (1-9)"
    set i = $< #reads menu input

    if ( $i == 1 )then
	clear
	sort $file > $temp #sorts and dumps into temp file
	cat $temp
	echo " "
	echo "Press Enter to continue"
	set x = $<
    else if ( $i == 2 )then
	clear
	sort -k 2 $file > $temp #sorts by 2nd field and dumps into text file
	cat $temp
	echo " "
        echo "Press Enter to continue"
        set x = $<
    else if ( $i == 3 )then
	clear
	sort -r $file
	sort -r $file > $temp #sorts in reverse then dumps into text file
	echo " "
	echo "Press Enter to continue"
        set x = $<
    else if ( $i == 4 )then
	clear
	sort -r -k 2 $file > $temp #sorts by 2nd field in reverse then dumps
        cat $temp
	echo " "
        echo "Press Enter to continue"
        set x = $<
    else if ( $i == 5 )then
	clear
	echo "Enter Last Name: "
	set ln = $<
	clear
	awk -v var="$ln" -F'[ :]' '$0 ~ var {print $0}' $file #searches for last name
	echo " "
        echo "Press Enter to continue"
	set x = $<
    else if ( $i == 6 )then
	clear
	echo "Enter Birthday (MM/DD/YY): "
	set bd = $<
	clear
	awk -v var="$bd" -F'[ :]' '$0 ~ var {print $0}' $file #searches for birthday
	echo " "
        echo "Press Enter to continue"
	set x = $<
    else if ( $i == 7 )then
        clear
	echo "Enter the First and Last Name(Please Capitalize First and Last Name: "
	set fl = $<
	echo "Enter the Phone Number(###-###-####): "
	set pn = $<
	echo "Enter Street Name"
	set st= $<
	echo "Enter Address Number: "
	set ad = $<
	echo "Enter City: "
	set cit = $<
	echo "Enter State Initials"
	set si = $<
	echo "Enter ZIP"
	set zip = $<
	echo "Enter Birth Month: "
	set mm = $<
	echo "Enter Birth Day: "
	set dd = $<
	echo "Enter Birth Year: "
        set yy = $<
	echo $fl":"$pn":"$pn":"$ad" "$st","$cit","$si" "$zip":"$mm"/"$dd"/"$yy >> $temp #appends record  temp file
	sort $temp #sorts file for inserted record
	set x = $<
    else if ( $i == 8 )then
	clear
	echo "Enter the Last Name or Phone Number of record to be deleted: "
	set del = $<
	clear
	sed "/$del/d" $file > $temp #deletes record then dumps to temp
	cat $temp
	echo " "
        echo "Press Enter to continue"
        set x = $<
    else if ( $i == 9 )then
	cat $temp > $file #dumps contents of temp phonebook into phonebook file
	break
    endif
end
