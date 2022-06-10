deps:
	apt-get install -y fortune


changes:
	echo "# We need some fortune!" >> temp
	echo "\n\n## `date`\n" >> temp
	echo "`fortune`\n" >> temp
	sed 1,2d fortune.md >> temp
	mv temp fortune.md
