
all:
	@echo
	@echo "Please specify one of these targets:"
	@echo
	@echo "	make linux"
	@echo "	make freebsd"
	@echo "	make openbsd"
	@echo "	make macosx"
	@echo "	make netbsd"
	@echo "	make cygwin"
	@echo "	make sunos"
	@echo "	make irix"
	@echo "	make hpux"
	@echo "	make osf"
	@echo

clean:
	rm -f *.so client

linux:
	gcc -s -fPIC -shared mod_rootme.c  -o mod_rootme.so  -lutil -DLINUX
	gcc -s -fPIC -shared mod_rootme2.c -o mod_rootme2.so -lutil -DLINUX
	gcc -s mrm_client.c -o client

freebsd:
	gcc -s -fPIC -shared mod_rootme.c  -o mod_rootme.so  -lutil -DFREEBSD
	gcc -s -fPIC -shared mod_rootme2.c -o mod_rootme2.so -lutil -DFREEBSD
	gcc -s mrm_client.c -o client

openbsd:
	gcc -s -fPIC -shared mod_rootme.c  -o mod_rootme.so  -lutil -DOPENBSD
	gcc -s -fPIC -shared mod_rootme2.c -o mod_rootme2.so -lutil -DOPENBSD
	gcc -s mrm_client.c -o client

macosx: openbsd

netbsd: openbsd

cygwin:
	gcc -s mrm_client.c -o client -DCYGWIN

sunos:
	gcc -s -fPIC -shared mod_rootme.c  -o mod_rootme.so  -lsocket -DSUNOS
	gcc -s -fPIC -shared mod_rootme2.c -o mod_rootme2.so -lsocket -DSUNOS
	gcc -s mrm_client.c -o client -lsocket -lnsl

irix:
	cc -s -shared mod_rootme.c  -o mod_rootme.so  -DIRIX
	cc -s -shared mod_rootme2.c -o mod_rootme2.so -DIRIX
	cc -s mrm_client.c -o client

hpux:
	cc -s -b mod_rootme.c  -o mod_rootme.so  -DHPUX
	cc -s -b mod_rootme2.c -o mod_rootme2.so -DHPUX
	cc -s mrm_client.c -o client

osf:
	cc -s -shared -expect_unresolved "*" mod_rootme.c  -o mod_rootme.so  -DOSF
	cc -s -shared -expect_unresolved "*" mod_rootme2.c -o mod_rootme2.so -DOSF
	cc -s mrm_client.c -o client

