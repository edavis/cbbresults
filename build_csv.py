#!/usr/bin/env python

import csv
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-o', '--output')
parser.add_argument('input')
args = parser.parse_args()

fieldnames = ['date', 'visitor', 'visitor_score', 'home', 'home_score', 'notes', 'location']
writer = csv.DictWriter(open(args.output, 'w'), fieldnames=fieldnames)
writer.writeheader()

slices = {
    'date': slice(0, 10),
    'visitor': slice(11, 33),
    'visitor_score': slice(34, 37),
    'home': slice(38, 60),
    'home_score': slice(61, 64),
    'remainder': slice(65, 100),
}

with open(args.input) as fp:
    for line in fp:
        line = line.strip()
        if line == '': continue
        obj = {k: line[v].strip() for k, v in slices.items()}

        remainder = obj.pop('remainder')
        if len(remainder) <= 3:
            notes, location = remainder, ''
        else:
            notes, location = remainder.split(' ', 1)

        obj.update({
            'notes': notes.strip(),
            'location': location.strip(),
        })

        writer.writerow(obj)
