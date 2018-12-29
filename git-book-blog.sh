#!/bin/bash
#
# 同步提交个人博客和gitbook
# liupeng0518@gmail.com
#
EBOOK=~/e-book/*
EBOOK_DIR=~/e-book
BLOG=~/github.io/source/_posts
COMMIT_INFO=$1
# 提交github
cd ${EBOOK_DIR}

git add .

git commit -m "${COMMIT_INFO}"
git push

#
for dir in $EBOOK
do
if [ -d "$dir" ]
then
_dir=`echo $dir|awk -F/ '{print $NF}'`
# echo ${_dir}
	cp -r $dir $BLOG
#         mv $BLOG/${_dir}/README.md /tmp/

fi
done	

#
cd ${BLOG}

hexo g

hexo d
