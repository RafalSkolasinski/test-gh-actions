FORTUNE_ID ?= test

deps:
	apt-get install -y fortune


changes:
	echo "## `date`\n" > fortune-${FORTUNE_ID}.md
	echo "`fortune`" >> fortune-${FORTUNE_ID}.md
