from flask import Flask

HELLO = "<p>Hello, Sandbox!</p>"

app = Flask(__name__)


@app.route("/")
def hello_world():
    return HELLO


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
