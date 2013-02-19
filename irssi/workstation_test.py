#!/usr/bin/env python
import urllib

if __name__ == '__main__':
    params = {}
    params['message'] = 'test message'
    params = urllib.urlencode(params)

    print "post:"
    f = urllib.urlopen("http://127.0.0.1:4223", params)
    print f.read()

    print "get:"
    f = urllib.urlopen("http://127.0.0.1:4223/?" + params)
    print f.read()
