import requests
import os


class ConnectionError(Exception):
    """Class derived from Exception, used below to catch connection error."""
    pass


def check_connection():
    req = requests.get('http://clients3.google.com/generate_204')
    try:
        if req.status_code != 204:
            raise ConnectionError
    except ConnectionError:
        os.system("sudo service dhcpd restart")


if __name__ == __main__:
    check_connection()
