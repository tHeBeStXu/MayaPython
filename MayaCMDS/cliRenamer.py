import argparse
import re
import os
import shutil

def main():
    parser = argparse.ArgumentParser(description="This is a batch renamer",
                                     usage="To replace all files with hello with goodbye instead: python cliRenamer.py hello goodbye")
    parser.add_argument('inString', help="The word to replace")
    parser.add_argument('outString', help='Theword to replace it with')

    parser.add_argument('-d', '--duplicate',
                        help="Whether to duplicate or replace in spot",
                        action='store_true')

    parser.add_argument('-r', '--regex',
                        help="Whether the patterns are regex or not",
                        action='store_true')
    parser.add_argument('-o', '--out',
                        help='The output location. Defaults to here')

    args = parser.parse_args()

if __name__ == '__main__':
    main()
