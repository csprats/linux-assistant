#!/bin/bash

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
			echo "OK, but this is a new funcion";
		*)
			echo "Comand not found, $anwser"
			assist
		;;
	esac
}

echo "Hello, how can I help you?"
assist
