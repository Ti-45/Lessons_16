import http.server
import os
import socketserver

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        trainer_name = os.environ.get('TRAINER_NAME','Karen Kostanyan')
        port = int(os.environ.get('PORT', 48888))
        response_text = f"Hello {trainer_name}. This is my exam project text"
        self.wfile.write(response_text.encode())

def run_server(port):
    with socketserver.TCPServer(("", port), MyHandler) as httpd:
        print("The server is running on port", port)
        httpd.serve_forever()

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 48888))
    run_server(port)