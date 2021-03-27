from flask import Flask
import os 

app = Flask(__name__)

@app.route('/')
def print_env_build_number():
    version = os.environ.get("BUILD_VERSION", default="DEV")
    return f"Hello, World! <br> <b>Build version = <i>{version}</i></b>"
