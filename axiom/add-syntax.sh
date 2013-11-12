#!/bin/sh

cat cat.txt  | sed  "s/\(^.*$\)/syn keyword axCategories \1/"  > categories.vim
cat com.txt  | sed "s/\s//g" | sed "s/\(^.*$\)/syn match axCommand \"\\\\V)\1\\\\m\"/" > commands.vim
cat dom.txt  | sed  "s/\(^.*$\)/syn keyword axDomain \1/" > domains.vim
cat pack.txt | sed  "s/\(^.*$\)/syn keyword axPackages \1/"  > packages.vim
cat op.txt   | sed "s/\\\\/\\\\\\\\/" | sed  "s/\(^[a-zA-Z].*$\)/syn keyword axOperation \1/" | sed  "s/\(^[^s].*$\)/syn match axOperation \"\\\\V\1\\\\m\"/" > operations.vim


