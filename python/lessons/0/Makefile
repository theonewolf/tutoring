tp-lesson0.html:
	ipython nbconvert --to html tp-lesson0.ipynb
	@sed -i \
		's/<title>\[\]<\/title>/<title>Teaching Python: Lesson 0<\/title>/g' \
		tp-lesson0.html

clean:
	rm tp-lesson0.html
