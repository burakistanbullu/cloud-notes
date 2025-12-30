from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Helloooo, world121'

if __name__ == '__main__':
    app.run()
