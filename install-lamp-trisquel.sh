#!/bin/bash

#Update the user's repositories
echo "---------------------------"
echo "***Updating Repositories***"
echo "---------------------------"
sudo apt-get update

#Ask user if they would like to install Apache2
while true
do
read -p "Would you like to install the Apache2 Web Server? [y/n]: " answer
case $answer in
	[yY]* ) echo "------------------------"
		echo "***Installing Apache2***"
		echo "------------------------"
		sudo apt-get install apache2
		break;;

	[nN]* ) break;;

	* ) 	echo "Please enter Y or N.";;
esac
done

#Ask user if they would like to install PHP
while true
do
read -p "Would you like to install PHP? [y/n]: " answer
case $answer in
	[yY]* ) echo "--------------------"
		echo "***Installing PHP***"
		echo "--------------------"
		sudo apt-get install php5

		#Create a php test file
		echo "----------------------------------------------------"
		echo "***Creating a test php page at localhost/test.php***"
		echo "----------------------------------------------------"
		sudo cp assets/php/test.php /var/www/html/test.php

		break;;

	[nN]* ) break;;

	* )	echo "Please enter Y or N.";;
esac
done

#Ask user if they would like to install MySQL
while true
do
read -p "Would you like to install MySql? [y/n]: " answer
case $answer in
	[yY]* ) echo "----------------------"
		echo "***Installing MySql***"
		echo "----------------------"
		sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
		break;;

	[nN]* ) break;;

	* )	echo "Please enter Y or N.";;
esac
done

#Ask user if they would like to install phpMyadmin
while true
do
read -p "Would you like to install phpMyAdmin? [y/n]: " answer
case $answer in
	[yY]* )	echo "---------------------------"
                echo "***Installing phpMyadmin***"
                echo "---------------------------"
		sudo apt-get install phpmyadmin
		break;;

	[nN]* ) break;;

	* ) 	echo "Please enter Y or N.";;
esac
done

#Ask user if they would like to install openSSH server
while true
do
read -p "Would you like to install the openSSH server? [y/n]: " answer
case $answer in
        [yY]* ) echo "-------------------------------"
                echo "***Installing openSSH server***"
                echo "-------------------------------"
                sudo apt-get install openssh-server
                break;;

        [nN]* ) break;;

        * )     echo "Please enter Y or N.";;
esac
done

#Auto-remove unnecessary files
echo "-------------------------------"
echo "***Removing unecessary files***"
echo "-------------------------------"
sudo apt-get autoremove

#Restart Apache
sudo /etc/init.d/apache2 restart
