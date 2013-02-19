#!/usr/bin/env python
import os
import cgi
from urlparse import urlparse
import socket
import BaseHTTPServer

class MyHandler(BaseHTTPServer.BaseHTTPRequestHandler):
    def do_GET(self):
        query = urlparse(self.path).query
        query_components = dict(qc.split("=") for qc in query.split("&"))
        self.respond(query_components['message'])

    def do_POST(self):
        form = cgi.FieldStorage(
            fp = self.rfile,
            headers = self.headers,
            environ={'REQUEST_METHOD': 'POST',
                     'CONTENT_TYPE': self.headers['Content-Type']
            }
        )
        self.respond(form.getvalue('message'))

    def respond(self, message):
        # acknowledge the request
        self.send_response(200)
        self.end_headers()

        # debug
        #print message

        # forward message to TCP socket for notossh
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect(('localhost', 4222))
        s.send(str(message))
        s.close()

def run(server_class=BaseHTTPServer.HTTPServer,
        handler_class=MyHandler):
    server_address = ('127.0.0.1', 4223)
    print "Running on %s:%d" % (server_address[0], server_address[1])
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()

if __name__ == '__main__':
    pid = os.fork()
    if (pid == 0):
        os.setsid()
        run()
    else:
        os._exit(0)
