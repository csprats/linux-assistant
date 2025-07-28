#!/bin/bash

function gitFunctions()
{
	read anwser
	
	case $anwser in
		
		"pull")
			echo "OK, pulling..."
			git pull
			echo "OK, pulled"
			gitFunctions
		;;
		"push")
			echo "OK, pushing..."
			git push
			echo "OK, pushed"
			gitFunctions
		;;
		"add")
			echo "OK, what do you want to add?"
			read archive
			git add $archive
			echo "OK, added"
			gitFunctions
		;;
		"comment")
			echo "OK, what's the comment?"
			read comment
			git commit -m "$comment"
			gitFunctions
		;;
		"exit")
			echo "OK, exit git functions"
			assist
		;;
		
	esac
}

function assist()
{
	read anwser

		case $anwser in
		"open")
			echo "OK, what archive?"
			read archive
			nano $archive
		;;

		"date")
			echo "OK, what month?"
			read month
			echo "And what day?"
			read day
			sudo date --set="2025-$month-$day 5:20:00"
			assist
		;;
		"search")
			echo "OK, what?"
			read search
			xdg-open "https://www.google.com/search?q=$search"
			assist
		;;
		"node")
			echo "OK, what archive?";
			read archive
			node $archive
			assist
		;;
		"git")
			echo "OK, please enter the directory"
			read d
			cd $d
			ls
			echo "Do you want to initialice a proyect? y = yes n = no"
			read yn
			case $yn in
				"y")
					  echo "OK, yes"
					  git init
					  gitFunctions
				;;
				"n")
					  echo "OK, no"
					  gitFunctions
				;;
				*)
					  echo "Invalid anwser"
					  assist
				;;
			esac
		;;
		*)
			echo "Comand not found, $anwser"
			assist
		;;
	esac
}

echo "Hello, how can I help you?"
assist
