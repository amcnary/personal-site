import os
import sys

from flask import Flask, render_template, send_from_directory

PORT = 8000
INDEX_PATH = 'dist'


app = Flask(__name__, template_folder=INDEX_PATH)


@app.route('/api/<path:method>', methods=['GET'])
def call_api(method):
  return {'method': method}


@app.route('/<path:path>', methods=['GET'])
def get_static_file(path):
  return send_from_directory(INDEX_PATH, path)


# Handle index path
@app.route('/', methods=['GET'])
def get_index():
  return render_template('index.html')


if __name__ == '__main__':
  try:
    PORT = int(sys.argv[1])
  except Exception, e:
    print 'Using default port %d' % PORT

  app.run(host='0.0.0.0', port=PORT)