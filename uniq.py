#!/usr/bin/env python2

seen = set()
with open('/dev/stdin') as file:
    for line in file:
        line = line.strip()
        if line in seen: continue
        seen.add(line)
        print line
