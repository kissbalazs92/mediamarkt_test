import random
import string
from faker import Faker

fake = Faker()

def random_email():
    return fake.email()

def random_username(length=8):
    return ''.join(random.choices(string.ascii_letters, k=length))

def random_password(length=12):
    characters = string.ascii_letters + string.digits + string.punctuation
    return ''.join(random.choices(characters, k=length))

def random_first_name():
    return fake.first_name()

def random_last_name():
    return fake.last_name()

def random_phone_number():
    return fake.phone_number()

def random_address():
    return fake.street_address()
