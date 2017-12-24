#!/usr/bin/python

import sys

try:
    import SimpleHTTPServer as server
    import SocketServer as socketserver

except ImportError:
    # python3
    import http.server as server
    import socketserver

handler = server.SimpleHTTPRequestHandler
map = handler.extensions_map
port = int(sys.argv[1])

# set default content-type
map[""] = "text/plain"

# serve everything as UTF-8
for key, value in map.items():
    map[key] = value + "; charset=utf-8"

# create but don't automatically bind socket
httpd = socketserver.ThreadingTCPServer(("locahost", port), handler, False)

# prevent 'cannot bind address' errors
# https://brokenbad.com/address-reuse-in-pythons-socketserver/
httpd.allow_reuse_address = True

# manually bind socket and start
httpd.server_bind()
httpd.server_activate()
print("🤖  Serving content on port: ", port)
httpd.serve_forever()
