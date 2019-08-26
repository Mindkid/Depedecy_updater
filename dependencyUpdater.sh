#! /bin/bash

# Replace LIB_PATH for the path where the libs
# are in the Server, don't give a space between
# the eqauls and the path.
SERVER_LIB_PATH=LIB_PATH


source pomParser.sh


help()
{
	echo "Use the follwoing commands:"
	echo "\t -s shows the libs that are on the server."
	echo "\t -d __POM_FILE__ performs a dif between the libs on the pom with the ones on the server."
	echo "\t -u __POM_FILE__  updates the libs of the pom to the server."
}

init()
{
	echo "------------------------------------------------------------------------------------"
	echo "------------------------------------------------------------------------------------"
	echo "----------------------------- DEPENDENCY UPDATER ------------------------------------"
	echo "------------------------------------------------------------------------------------"
	echo "------------------------------------------------------------------------------------"
	echo
	echo "This script was developed to help the synchronization between the pom and the server."
	echo "Using the PATH of the server libs, this script can perform three operation:"
	echo "\t - Performs the current libs of the server."
	echo "\t - Checks for diferences on the libs of the server with a given pom file."
	echo "\t - Updates the libs os the system given a pom file."
	echo
	echo "------------------------------------------------------------------------------------"
	echo "------------------------------------------------------------------------------------"
}

init

while getopts ":sd:u::h" o; do
    case "${o}" in
        s)
			listJars $SERVER_LIB_PATH
            ;;
        d)
			checkDiff $1
            ;;
        u)
			echo "this is arg 1: " $1 
			echo "this is arg 2: " $2
            ;;
        *)
            help
            ;;
    esac
done


# This function lists all the jars
# of the given SERVER_LIB_PATH, it
# also searchs on sub-directories
  
listJars()
{
	for  j in $1
	do
		if [ -d $j]; then
			listJars $j
		else
			if [ ($j :-4)  == ".jar"]
				echo $j
			fi
		fi		
	done
}


checkDiff()
{

}

updateLibsFromPom()
{


}