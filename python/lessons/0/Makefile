tp-lesson0.html:
	ipython nbconvert --to html tp-lesson0.ipynb
	@sed -i \
		's/<title>\[\]<\/title>/<title>Teaching Python: Lesson 0<\/title>/g' \
		tp-lesson0.html
	@sed -i \
		's/body{background-color:white;position:absolute;left:0px;right:0px;top:0px;bottom:0px;overflow:visible;}/body{background-color:white;margin-left:auto;margin-right:auto;width:600px;overflow:visible;}/g' \
		tp-lesson0.html

clean:
	rm tp-lesson0.html
