#!/usr/bin/env python3

from os.path import exists
from pickle import dumps, loads
from argparse import ArgumentParser
from cryptography.fernet import Fernet

key = b'DfOaFLRVToUyjSRRo0ZqeVAu3Bksp_z9bp-uFpgvfsU='
cipher = Fernet(key)
path = './config/'


def write_file(data, file):
    data = dumps(data)
    data = cipher.encrypt(data)
    with open(file, 'wb') as file:
        file.write(data)


def read_file(file):
    with open(file, 'rb') as file:
        data = file.read()
    data = cipher.decrypt(data)
    data = loads(data)
    return data


def get_data():
    return read_file(path+'data.dat')


def log_out():
    data = {'uuid': None, 'username': ''}
    write_file(data, path+'data.dat')


def log_in(username, uuid):
    data = {'uuid': uuid, 'username': username}
    write_file(data, path+'data.dat')

    
def save_to(file_path):
    data = get_data()
    write_file(data, file_path)


def load_from(file_path):
    data = read_file(file_path)
    log_in(data['username'], data['uuid'])


def main():
    if not exists(path):
        print("This directory does not contain a g_Bloxy's leaderboard account configuration")
        return

    parser = ArgumentParser(
        prog='AccountManager',
        description="g_Bloxy's leaderboards account manager"
    )
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('--get',    '-g', action='store_true',                   help='get current account')
    group.add_argument('--logout', '-o', action='store_true',                   help='log out')
    group.add_argument('--login',  '-i', metavar=('username', 'uuid'), nargs=2, help='log in with username and uuid')
    group.add_argument('--save',   '-s', metavar='file',                        help='save current account to file')
    group.add_argument('--load',   '-l', metavar='file',                        help='load account from file')
    args = parser.parse_args()

    if args.get:
        data = get_data()
        print('Current account informations :')
        print(f'username : {data["username"]}')
        print(f'uuid : {data["uuid"]}')

    elif args.login:
        log_in(args.login[0], args.login[1])
        print('Logged in')

    elif args.logout:
        log_out()
        print('Logged out')

    elif args.save:
        save_to(args.save)
        print(f'Saved to {args.save}')

    elif args.load:
        load_from(args.load)
        print(f'Loaded from {args.load}')

    else:
        parser.print_help()


if __name__ == '__main__':
    main()
    exit()
