import socket

def start_server():
    # Создаем сокет
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Привязываем сокет к адресу и порту
    s.bind(('localhost', 4000))

    # Слушаем порт
    s.listen(1)
    print('Server started, listening on port 4000...')

    while True:
        # Принимаем входящее соединение
        conn, addr = s.accept()
        print('Connected by', addr)

        # Отправляем сообщение клиенту
        conn.sendall(b'programm test')

        # Закрываем соединение
        conn.close()

if __name__ == '__main__':
    start_server()

