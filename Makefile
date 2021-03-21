install:
	pip install --upgrade pip &&\
		pip install -r app/requirements.txt
	
lint:
	pylint --disable=R,C,W1203 app.py
	
all: install lint