from urllib.parse import urlparse

def get_url_path(url):
    return urlparse(url).path