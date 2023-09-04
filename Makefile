.PHONY: build
build:
	docker build -t youtuber:latest -f youtuber.dockerfile .

.PHONY: run
run:
	docker run --rm --name youtuber -v ./whisper/:/root/.cache/whisper -v ./workspace:/workspace -it youtuber:latest /bin/bash
