import os
from flask import Flask, app

app = Flask(__name__)

@app.route('/')
def hello_world():
    trainer_name = os.environ.get('TRAINER_NAME', 'Undefined')
    return f'Hello {trainer_name}! This is my exam project.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))