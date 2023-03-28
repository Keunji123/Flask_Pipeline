# app.py

from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def hello():
    dirListing = os.listdir("./static/images")
    return render_template('main.html', dirListing=dirListing)
    
if __name__ == '__main__':
    app.run(debug=True)