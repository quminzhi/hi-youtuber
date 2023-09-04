# How to Use Youtuber

## Prerequisite

You have to have these tools installed on your machine:

- Docker Engine
- Python
- Git

## Usage

- Build `youtuber` image with `make build` or manually execute `docker build -f youtuber.dockerfile -t youtuber:latest .`
- Start youtuber container by `make run` or `docker run --name youtuber -v ./whisper/:/root/.cache/whisper -v ./workspace:/workspace -it youtuber:latest /bin/bash`, where cache files for whisper and worksapce folder are mounted. Note executable file is passed into container in Dockerfile.
- Download videos you like with `yt-dlp <url>`
- Convert video files from `.mweb` format to `.mp4` format and generate transcriptions with `whisper`.
- If you just need to add transcriptions for a video file, use `trans` to do it.
