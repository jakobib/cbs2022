html: cbs2022voss.html

cbs2022voss.html: slides.md 
	pandoc -s -t revealjs --slide-level 2 -V css=style.css \
		-V theme=white -V transition=fade -V backgroundTransition=fade \
		$< -o $@
	
