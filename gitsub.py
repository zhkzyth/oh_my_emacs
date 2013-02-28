#!/usr/bin/env python
# encoding: utf-8
"""
gitsub.py

Created by <zhkzyth@gmail.com> on Feb 27, 2013
"""

from cStringIO import StringIO
import re
import subprocess

url = re.compile(r'url')
path = re.compile(r'path')
sub = re.compile(r'^\[')

def do_sub_add(gitfile, start, end):
    """ do git submodule add """
    git_line = StringIO(gitfile)
    in_sub = False

    for line in git_line:
        if sub.search(line):
            pass
        elif path.search(line):
            tmp1 = line.strip()[7:]
        elif url.search(line):
            tmp2 = line.strip()[6:]
            yield "git submodule add " + tmp2 + ' ' + tmp1
        else:
            pass



if __name__ == '__main__':
    import sys
    gitfile = sys.argv[1]
    start = "url"
    end = "path"
    git_string = open(gitfile).read()
    result = do_sub_add(git_string, start, end)
    for line in result:
        proc = subprocess.Popen(line,shell=True,stdin=subprocess.PIPE,stdout=subprocess.PIPE)
        #print line
        proc.wait()
