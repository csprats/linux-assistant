#!/bin/bash

function assist()
{
	read anwser

		case $anwser in
		"open")
			echo "OK, what archive?"
			read archive
			./$archive.sh
		;;

		"date")
			echo "OK, what date?"
			read date
			sudo date --set="2025-$date 5:20:00"
			assist
		;;
		"search")
			echo "OK, what?"
			read search
			xdg-open "https://www.google.com/search?q=$search"
			assist
		;;
		"launch")
			cd web
			cd backend-server
			npm run start
			cd ..
			cd ..
			assist
		;;
		"node")
			echo "OK, what archive?";
			read archive
			node $archive.js
			assist
		;;
		*)
			echo "Comand not found, $anwser"
			assist
		;;
	esac
}

echo "Hello, how can I help you?"
assist
