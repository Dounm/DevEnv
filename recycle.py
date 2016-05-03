#!/usr/bin/env python
#Author:Dounm

import sys, time, os
import shutil

#argv[1] is the recycle_bin_dir
#argv[2] is deny list within '' or "" which are splited by blank space
#argv[3] and after are the folders to be removed

recycle_dir = sys.argv[1] 
if not os.path.isdir(recycle_dir):
    os.mkdir(recycle_dir)

deny_set = set(sys.argv[2].split(' '))
if '' in deny_set:
    deny_set.remove('')
deny_set.add('/')


para_set = set(sys.argv[3:])
rm_para_set = set(['-f', '-rf', '-r'])
para_set -= rm_para_set

intersec_set = deny_set&para_set
for item in intersec_set:
    print 'the <%s> cannot be removed due to the config' % item

para_set -= intersec_set

#move the files to recycle bin
cur_time = time.strftime('%Y%m%d-%H-%M-%S', time.localtime(time.time()))
for f in para_set:
    if '/' not in f:
        recycle_f = '%s/%s_%s' % (recycle_dir, cur_time, f)
    else:
        path = os.path.dirname(f)
        file_name = os.path.basename(f)
        if file_name == '':
            file_name = path.split('/')[-1]
        recycle_f = '%s/%s_%s' % (recycle_dir, cur_time, file_name)
    shutil.move(f, recycle_f)




#TODO: support the usage of 'rm /path/*'
