#!/bin/bash

original_filename="password.x.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.p.o.n.m.l.k.j.i.h.g.f.e.d.c.b.a.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p"

cp $original_filename "new"

while true
do
	mv "new" "old" 2>/dev/null
	current_file_info=`file -b old`

	if grep --silent "Zip" <<< "$current_file_info"
	then
		unzip -q -o old -d tmp && mv tmp/* "new"
	fi

	if grep --silent "XZ" <<< "$current_file_info"
	then
		mv old old.xz
		unxz old.xz
	fi

	if grep --silent "bzip2" <<< "$current_file_info"
	then
		mv old old.bz2
		bzip2 -d old.bz2
	fi

	if grep --silent "gzip" <<< "$current_file_info"
	then
		mv old old.gz
		gunzip -d old.gz
	fi

	if grep --silent "ASCII" <<< "$current_file_info"
	then
		break
	fi
done

cat old

rm -d tmp
rm old
