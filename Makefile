default: run

run : build
	mkdir -p $(PWD)/data
	docker run --name prosodylabaligner-cy -i -t -v $(PWD)/data/:/usr/local/Prosodylab-Aligner/data/ techiaith/prosodylabaligner-cy bash

build:
	docker build --rm -t techiaith/prosodylabaligner-cy .

clean: stop
	docker rmi techiaith/prosodylabaligner-cy

stop:
	docker stop prosodylabaligner-cy
	docker rm prosodylabaligner-cy
