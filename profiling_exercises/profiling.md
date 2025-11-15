# Profiling

## Using the time module
```python
import time, random
n = random.randint(1, 10) * 100

# Get current time
start = time.time()

# Do some work
print("Sleeping for {} ms".format(n))
time.sleep(n/1000)

# Compute time between start and now
print(time.time() - start)
```
This measures the wall clock time Note that due to context switch it may or may not get cpu time.
## Types of Time Measures
1. **Real** This is the wall clock time seen via the time module.
2. **User** Amount of time spent in CPU running user code.
3. **Sys** Amount of time spent in CPU in running kernel code.
## Types of Proilers
1. **Tracing Profilers:-** They trace every part of your code introducing some overhead along with it.
2. **Sampling Profilers:-** They probe the programs call stack periodically.

## cProfile and Line Profilers
CProfile gives detailed measure of the time taken to profile a process. Including the time for different functions.

Line Profilers give informations about the time spent in each line.
```python
#!/usr/bin/env python
import requests
from bs4 import BeautifulSoup

# This is a decorator that tells line_profiler
# that we want to analyze this function
@profile
def get_urls():
    response = requests.get('https://missing.csail.mit.edu')
    s = BeautifulSoup(response.content, 'lxml')
    urls = []
    for url in s.find_all('a'):
        urls.append(url['href'])

if __name__ == '__main__':
    get_urls()
```
## Line Profiling

To perform **line-by-line profiling** in Python:

```bash
pip install line_profiler
kernprof -l myscript.py   # This saves a file named myscript.py.lprof
python -m line_profiler myscript.py.lprof
```