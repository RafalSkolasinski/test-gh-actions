FORTUNE_ID ?= test

deps:
	apt-get install -y fortune


changes:
	echo "## `date`\n" > fortune-${FORTUNE_ID}.md
	echo "`fortune`" >> fortune-${FORTUNE_ID}.md


package:
	tar cvfz fortunes.tgz --exclude-from .tgz.exclude *.md
