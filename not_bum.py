#!/usr/bin/env python2

bum = set()

with open('bum_w.txt') as file:
    for line in file:
        bum.add(line.strip().lower())

with open('all_w.txt') as file:
    for line in file:
        line = line.strip().lower()
        if line in bum: continue
        print line
