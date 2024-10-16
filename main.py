from flask import Flask
import os
app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

print("done")
port = 5000
app.run(debug=True, host='0.0.0.0', port=port)