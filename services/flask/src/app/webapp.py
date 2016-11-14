from flask import Flask, render_template, request
import os
PATH = os.path.abspath(__file__)

STATIC_PATH =os.path.abspath(os.path.join(PATH, '../../static'))
TEMPLATE_PATH = os.path.abspath(os.path.join(PATH, '../../templates'))

print STATIC_PATH, TEMPLATE_PATH
app = Flask(
    __name__,
    static_folder=STATIC_PATH,
    template_folder=TEMPLATE_PATH,
)


@app.route('/')
def index():
    print(dir(request))
    ctx = {
        'title': 'Flask en Copose',
    }
    return render_template('index.html', **ctx)


@app.route('/auth/user', methods=['POST'])
def auth_user():
    '''
    https://github.com/rabbitmq/rabbitmq-auth-backend-http#what-must-my-web-server-do
    '''
    if request.form.get('username') == 'admin':
        return 'allow administrator'
    return 'allow management'


@app.route('/auth/vhost', methods=['POST', 'GET'])
def auth_vhost():
    '''
    https://github.com/rabbitmq/rabbitmq-auth-backend-http#what-must-my-web-server-do
    '''
    print 'user'
    return 'allow'


@app.route('/auth/resource', methods=['POST', 'GET'])
def auth_resource():
    '''
    https://github.com/rabbitmq/rabbitmq-auth-backend-http#what-must-my-web-server-do
    '''
    return 'allow'


@app.route('/api/whoami', methods=['POST', 'GET'])
def api_whoami():
    return 'allow'


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
