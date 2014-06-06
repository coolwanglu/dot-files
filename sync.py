#!/usr/bin/env python

"""
Update files from home dir

by WangLu
2011.04.18
"""

import shutil
import sys
import os
import os.path

IGNORE=['.git', '.svn', 'README']
EPS=1.e-6

AVAILABLE_COMMANDS=['update','list']
COMMAND='update'

class Updater():
    def relative_path(self, path):
        assert path.startswith(self.work_dir)
        return path[len(self.work_dir)+1:]

    def update(self, f):
        rf = self.relative_path(f)
        target = os.path.join(self.home_dir, rf)
        if not os.path.exists(target):
            print rf, 'does not exist!'
        elif os.path.isdir(target):
            print rf, 'is a directory!'
        else:
            ftime = os.path.getmtime(f)
            ttime = os.path.getmtime(target)

            if ftime < ttime-EPS:
                shutil.copy2(target, f)
                print rf, 'updated'
            elif ftime > ttime+EPS:
                print rf, 'is newer than the one in the home dir!'
            else:
                pass

    def process(self, arg, dirname, fnames):
        fnames[:] = [i for i in fnames if i not in IGNORE]

        if COMMAND == 'list':
            print '[%s]'%(dirname,)
            print ' '.join(fnames)
            print

        elif COMMAND == 'update':
            for i in fnames:
                f = os.path.join(dirname, i)
                if os.path.isfile(f):
                    self.update(f)
                elif os.path.isdir(f):
                    continue #ignore
                else:
                    print 'Unknown file type:', self.relative_path(f)

    def work(self):
        global IGNORE
        self.full_path = os.path.realpath(sys.argv[0])
        self.work_dir = os.path.dirname(os.path.realpath(sys.argv[0]))
        self.file_name = os.path.basename(self.full_path)
        self.home_dir = os.path.expanduser('~')
        IGNORE.append(self.file_name)

        os.path.walk(self.work_dir, self.process, None)

        print 'Done.'

if __name__ == '__main__':
    if len(sys.argv) > 1:
        if sys.argv[1] not in AVAILABLE_COMMANDS:
            print 'Unknown command: '. sys.argv[1]
            sys.exit(-1)
        
        COMMAND = sys.argv[1]
    Updater().work()


