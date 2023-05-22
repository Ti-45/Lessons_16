import socket

def start_server():
    # Создаем сокет
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Привязываем сокет к адресу и порту
    s.bind(('localhost', 48888))

    # Слушаем порт
    s.listen(1)
    print('Server started, listening on port 48888...')

    while True:
        # Принимаем входящее соединение
        conn, addr = s.accept()
        print('Connected by', addr)

        # Отправляем сообщение клиенту
        message = b'test praydon'
        conn.sendall(message)

        # Записываем сообщение в файл
        with open('output.txt', 'wb') as f:
            f.write(message)

        # Закрываем соединение
        conn.close()

if __name__ == '__main__':
    start_server()