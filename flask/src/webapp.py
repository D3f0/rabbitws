from flask import Flask, render_template, request
import os

app = Flask(__name__)


@app.route('/')
def index():
    print(dir(request))
    ctx = {
        'title': 'Flask en Copose',
    }
    return render_template('index.html', **ctx)

if __name__ == '__main__':
    try:
        PORT = int(os.environ.get('PORT'))
    except (TypeError, KeyError, ValueError) as e:
        PORT = 4000
    app.run(
        debug=os.environ.get('DEBUG', False),
        port=PORT,
        host='0',
    )
