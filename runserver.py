"""
This script runs the smART application using a development server.
"""

from os import environ
from server import app
from server.views import Sinif 
if __name__ == '__main__':
    HOST = environ.get('0.0.0.0', 'localhost')
    try:
        PORT = int(environ.get('80', '5000'))
    except ValueError:
        PORT = 80
    Sinif().sinif()
    #app.run(HOST, PORT)

