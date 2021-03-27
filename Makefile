install:
	pip install --upgrade pip &&\
		pip install -r app/requirements.txt
	# Install hadolint
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	chmod +x ./hadolint
	
lint:
	pylint --disable=R,C,W1203 app/app.py
	# This is linter for Dockerfiles
	./hadolint Dockerfile

	
all: install lint