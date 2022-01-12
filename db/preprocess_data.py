"""
This module preprocesses a csv file by modifying rows that MySQL reads incorrectly.

Author: Sarah Zhang
Date Created: 11/15/21
Date Updated: 12/5/21

"""


OBJECTS_FILE = open("objects.csv", "r", encoding="utf-8")

# Create a new objects file, if it doesn't already exist
new_objects_file = open("objects_new.csv", "w", encoding="utf-8")

# Modify problematic rows
lines = OBJECTS_FILE.readlines()
for line in lines:
    line = line.replace('\\', '')
    new_objects_file.write(line)

OBJECTS_FILE.close()
new_objects_file.close()