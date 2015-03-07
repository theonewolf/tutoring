tp-lesson1.html:
	ipython nbconvert --to html tp-lesson1.ipynb
	@sed -i \
		's/<title>\[\]<\/title>/<title>Exploring an Infinite Limit<\/title>/g' \
		tp-lesson1.html
	@sed -i \
		's/body{background-color:white;position:absolute;left:0px;right:0px;top:0px;bottom:0px;overflow:visible;}/body{background-color:white;margin-left:auto;margin-right:auto;width:600px;zoom:1.5;overflow:visible;}/g' \
		tp-lesson1.html

clean:
	rm tp-lesson1.html
