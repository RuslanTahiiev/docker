import time
import redis

cache = redis.Redis(host='localhost', port=6379)


def get_hit_count() -> int:
    retries: int = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)
