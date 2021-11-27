all:		log
			@rm -rf cv.aux cv.log cv.out

clean:
			@rm -rf cv.aux cv.log cv.out
			@rm -rf cv.pdf

log:
			@xelatex cv.tex

