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

IGNORE=['.git', '.svn']

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
            ftime = os.path.getctime(f)
            ttime = os.path.getctime(target)

            if ftime < ttime:
                shutil.copy2(target, f)
                print rf, 'updated'
            elif ftime > ttime:
                print rf, 'is newer than the one in the home dir!'
                shutil.copy2(target, f)
            else:
                pass

    def process(self, arg, dirname, fnames):
        for i in fnames:
            if i in IGNORE:
                fnames.remove(i)
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

if __name__ == '__main__':
    Updater().work()




