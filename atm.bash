#!/bin/bash
#CS 2600 Project 3
#Ryan Mangilin
echo "*** Welcome to Cal Poly's ATM System ***"
echo "Please enter your PIN:"
savings=1000 #initial balance of savings account
checking=1000 #initial balance of checking account
pin=111 #legal pin
pinCount=1 #pin count for multiple invalid pin error
while [ $pinCount -lt 4 ] #has 3 tries to enter pin correctly
do
    read pinIN #takes pin input
    if [ $pinIN == $pin ] #checks if pin is correct
    then
	while [ TRUE ] #loop the menu to reprompt after each option
	do
	    clear
	    echo "*** Welcome to Cal Poly's ATM System ***"
	    echo " "
	    echo "(1) Transfer from checking account to savings account"
	    echo "(2) Transfer from savings account to checking account"
	    echo "(3) Savings account balance"
	    echo "(4) Checking account balance"
	    echo "(5) Withdraw Cash from either account"
	    echo "(6) Exit"
	    echo "==> Please select option (1-6)"
	    read i #takes in menu input
	    if [ $i == 1 ] 
	    then
		echo "Enter the amount you wish to transfer from checking account to savings account"
		read transfer1 #amount wished to transfer
		if [ $transfer1 -le $checking ] #checks if transfer amount is less than balance to see if transfer is possible
		then
		    savings=`expr $savings + $transfer1` #adds transfer amount to savings
		    checking=`expr $checking - $transfer1` #subtractws transfer amount from checking
		else
		    echo "Transfer not completed"
		    echo "Current balance of checking account is $checking"
		    echo "Enter any button to continue"
		    read x #pauses program to read the messages and takes input to continue
		fi
	    elif [ $i == 2 ]
	    then
		echo "Enter the amount you wish to transfer from savings account to checking account"
                read transfer2
                if [ $transfer2 -le $savings ]
                then
                    checking=`expr $checking + $transfer2`
                    savings=`expr $savings - $transfer2`
                else
                    echo "Transfer not completed"
                    echo "Current balance of savings account is $savings"
                    echo "Enter any button to continue"
                    read x #pauses program
                fi
	    elif [ $i == 3 ]
	    then
		 echo "Current balance of savings account is $savings"
                 echo "Enter any button to continue"
                 read x #pauses program
	    elif [ $i == 4 ]
	    then
		 echo "Current balance of checking account is $checking"
                 echo "Enter any button to continue"
                 read x #pauses program
	    elif [ $i == 5 ]
	    then
		echo "Enter the amount you wish to withdraw"
		read withdraw #takes amount wished to withdraw
		clear
		echo "What account would you like to withdraw from?"
		echo "(1) Savings"
		echo "(2) Checking"
		read account #chooses which account
		if [ $account == 1 ]
		then
		    if [ $withdraw -le $savings ] #checks if can be honored
		    then
			savings=`expr $savings - $withdraw` #withdraws from savings
		    else
			echo "Transfer not completed"
			echo "Current balance of savings account is $savings"
			echo "Enter any button to continue"
			read x
		    fi
		elif [ $account == 2 ]
		then
		    if [ $withdraw -le $checking ] #checks if can be honored
		    then
			checking=`expr $checking - $withdraw` #withdraws from checking
		    else
			echo "Transfer not completed"
                        echo "Current balance of checking account is $checking"
                        echo "Enter any button to continue"
                        read x
		    fi
		fi
	    elif [ $i == 6 ]
	    then
		clear
		echo "Thank you for using the ATM system."
		exit 0 #exits script
	    fi
	done
    else
	clear
	echo "*** Welcome to Cal Poly's ATM System ***"
	echo "Please enter your PIN:"
	pinCount=`expr $pinCount + 1` #increases pin count for illegal pins error
    fi
done
clear
echo "Too many illegal PINs. Try later again."
