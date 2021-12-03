all:		log
			@rm -rf cv.aux cv.log cv.out

clean:
			@rm -rf cv.aux cv.log cv.out
			@rm -rf cv.pdf

log:
			@clear -x
			@echo "Making CV.."
			@xelatex cv.tex > /dev/null 2>&1
			@echo "Finished!"

