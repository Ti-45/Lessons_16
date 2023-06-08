import http.server
import socketserver

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(b"port request succeeded")

PORT = 48888

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print("The server is running on a port", PORT)
    httpd.serve_forever()