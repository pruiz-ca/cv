all:		log
			@/bin/rm -rf cv.aux cv.log cv.out

clean:
			@/bin/rm -rf cv.aux cv.log cv.out
			@/bin/rm -rf cv.pdf

log:
			@/bin/echo "Making CV.."
			@xelatex cv.tex > /dev/null 2>&1
			@/bin/echo "Finished creating cv.pdf"

