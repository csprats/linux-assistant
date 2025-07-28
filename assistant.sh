#!/bin/bash

function gitFunctions()
{
	read anwser
	echo ""
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
			echo "Comment added"
			gitFunctions
		;;
		"comands")
			cat ./comands.txt
			gitFunctions
		;;
		"exit")
			echo "OK, exit git functions"
			assist
		;;
		*)
			echo "Git comand not found, $anwser"
			gitFunctions
		;;
		
	esac
}

function assist()
{
	read anwser
	echo ""
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
		"comands")
			cat ./comands.txt
			assist
		;;
		"git")
			echo "OK, please enter the directory"
			read d
			echo ""
			cd $d
			echo "OK, showing contents"
			echo ""
			ls
			echo ""
			echo "Do you want to initialice a proyect? y = yes n = no"
			read yn
			case $yn in
				"y")
					  echo "OK, yes"
					  echo "Enter git function"
					  git init
					  gitFunctions
				;;
				"n")
					  echo "OK, no"
					  echo "Enter git comand"
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
			echo "Showing all comands..."
			cat ./comands.txt
			assist
		;;
	esac
}

echo "Hello, how can I help you?"
assist
