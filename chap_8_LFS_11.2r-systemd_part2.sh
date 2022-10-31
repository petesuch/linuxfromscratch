####  Chapter 8 of LFS compile and  install script
#  PART 2
#  This script is Part 2!!!

##  Please read the README and the introduction to part1.

##  You must be root, have already mounted the host kernel filesystems and
##  have chrooted into the LFS environment:  (lfs chroot):/sources#

##  This script will require at least a day to compile, test, and install.
##  But at least you don't have to sit infront the computer the entire time.


LFSSRCS='/sources'
cd $LFSSRCS


###################################################################
##  8.34. Bash-5.1.16
ZZ_FILE='bash-5.1.16.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr                      \
            --docdir=/usr/share/doc/bash-5.1.16 \
            --without-bash-malloc              \
            --with-installed-readline

make

# chown -Rv tester .
# su -s /usr/bin/expect tester << EOF
# set timeout -1
# spawn make tests
# expect eof
# lassign [wait] _ _ _ value
# exit $value
# EOF

make install
#exec /usr/bin/bash --login

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
##  8.35. Libtool-2.4.7
ZZ_FILE='libtool-2.4.7.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make

make check

make install

rm -fv /usr/lib/libltdl.a

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.36. GDBM-1.23
ZZ_FILE='gdbm-1.23.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

make
make check
make install

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.37. Gperf-3.1
ZZ_FILE='gperf-3.1.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`

cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

make
make -j1 check
make install

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.38. Expat-2.4.8
ZZ_FILE='expat-2.4.8.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.4.8

make
make check
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.4.8

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.39. Inetutils-2.3
ZZ_FILE='inetutils-2.3.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

make
make check
make install
mv -v /usr/{,s}bin/ifconfig


## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.40. Less-590
ZZ_FILE='less-590.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --sysconfdir=/etc
make
make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.41. Perl-5.36.0
ZZ_FILE='perl-5.36.0.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

export BUILD_ZLIB=False
export BUILD_BZIP2=0

sh Configure -des                                         \
             -Dprefix=/usr                                \
             -Dvendorprefix=/usr                          \
             -Dprivlib=/usr/lib/perl5/5.36/core_perl      \
             -Darchlib=/usr/lib/perl5/5.36/core_perl      \
             -Dsitelib=/usr/lib/perl5/5.36/site_perl      \
             -Dsitearch=/usr/lib/perl5/5.36/site_perl     \
             -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl  \
             -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl \
             -Dman1dir=/usr/share/man/man1                \
             -Dman3dir=/usr/share/man/man3                \
             -Dpager="/usr/bin/less -isR"                 \
             -Duseshrplib                                 \
             -Dusethreads

make
make test
make install
unset BUILD_ZLIB BUILD_BZIP2

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.42. XML::Parser-2.46
ZZ_FILE='XML-Parser-2.46.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

perl Makefile.PL
make
make test

make install

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.43. Intltool-0.51.0
ZZ_FILE='intltool-0.51.0.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr

make
make check

make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.44. Autoconf-2.71
ZZ_FILE='autoconf-2.71.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make
make check
make install

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.45. Automake-1.16.5
ZZ_FILE='automake-1.16.5.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5

make
make -j4 check
# The test t/subobj.sh is known to fail.
make install

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.46. OpenSSL-3.0.5
ZZ_FILE='openssl-3.0.5.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make
make test

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.5

cp -vfr doc/* /usr/share/doc/openssl-3.0.5


## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
##  8.47. Kmod-30
ZZ_FILE='kmod-30.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib


make
make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod

## Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.27. Pkg-config-0.29.2
ZZ_FILE='pkg-config-0.29.2.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --with-internal-glib --disable-host-tool --docdir=/usr/share/doc/pkg-config-0.29.2

make
make check
make install

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
## 8.28. Ncurses-6.3
ZZ_FILE='ncurses-6.3.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --enable-widec          \
            --with-pkg-config-libdir=/usr/lib/pkgconfig

make
make DESTDIR=$PWD/dest install
install -vm755 dest/usr/lib/libncursesw.so.6.3 /usr/lib
rm -v  dest/usr/lib/libncursesw.so.6.3
cp -av dest/* /

for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done

rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sfv libncurses.so      /usr/lib/libcurses.so


mkdir -pv /usr/share/doc/ncurses-6.3
cp -v -R doc/* /usr/share/doc/ncurses-6.3

make distclean
./configure --prefix=/usr    \
            --with-shared    \
            --without-normal \
            --without-debug  \
            --without-cxx-binding \
            --with-abi-version=5

make sources libs
cp -av lib/lib*.so.5* /usr/lib


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.29. Sed-4.8
ZZ_FILE='sed-4.8.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make
make html

chown -Rv tester .
su tester -c "PATH=$PATH make check"

make install
install -d -m755 /usr/share/doc/sed-4.8
install -m644 doc/sed.html /usr/share/doc/sed-4.8


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
##  8.30. Psmisc-23.5
ZZ_FILE='psmisc-23.5.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make
make install

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.31. Gettext-0.21
ZZ_FILE='gettext-0.21.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21

make
make check
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.32. Bison-3.8.2
ZZ_FILE='bison-3.8.2.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2
make
make check
make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
##  8.33. Grep-3.7
ZZ_FILE='grep-3.7.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr
make
make check
make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
##  8.34. Bash-5.1.16
ZZ_FILE='bash-5.1.16.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --docdir=/usr/share/doc/bash-5.1.16 --without-bash-malloc --with-installed-readline

make
chown -Rv tester .
su -s /usr/bin/expect tester << EOF
set timeout -1
spawn make tests
expect eof
lassign [wait] _ _ _ value
exit $value
EOF

make install
#exec /usr/bin/bash --login

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
##  8.35. Libtool-2.4.7
ZZ_FILE='libtool-2.4.7.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make
make check
make install

rm -fv /usr/lib/libltdl.a

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.36. GDBM-1.23
ZZ_FILE='gdbm-1.23.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

make
make check
make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
## 8.37. Gperf-3.1
ZZ_FILE='gperf-3.1.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`

cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

make
make -j1 check
make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
### 8.38. Expat-2.4.8
ZZ_FILE='expat-2.4.8.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.4.8

make
make check
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.4.8

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
### 8.39. Inetutils-2.3
ZZ_FILE='inetutils-2.3.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

make
make check
make install
mv -v /usr/{,s}bin/ifconfig

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
### 8.40. Less-590
ZZ_FILE='less-590.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --sysconfdir=/etc
make
make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
### 8.41. Perl-5.36.0
ZZ_FILE='perl-5.36.0.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

export BUILD_ZLIB=False
export BUILD_BZIP2=0

sh Configure -des                                         \
             -Dprefix=/usr                                \
             -Dvendorprefix=/usr                          \
             -Dprivlib=/usr/lib/perl5/5.36/core_perl      \
             -Darchlib=/usr/lib/perl5/5.36/core_perl      \
             -Dsitelib=/usr/lib/perl5/5.36/site_perl      \
             -Dsitearch=/usr/lib/perl5/5.36/site_perl     \
             -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl  \
             -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl \
             -Dman1dir=/usr/share/man/man1                \
             -Dman3dir=/usr/share/man/man3                \
             -Dpager="/usr/bin/less -isR"                 \
             -Duseshrplib                                 \
             -Dusethreads

make
make test
make install
unset BUILD_ZLIB BUILD_BZIP2

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
### 8.42. XML::Parser-2.46
ZZ_FILE='XML-Parser-2.46.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

perl Makefile.PL
make
make test

make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
#### 8.43. Intltool-0.51.0
ZZ_FILE='intltool-0.51.0.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr

make
make check

make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
#### 8.44. Autoconf-2.71
ZZ_FILE='autoconf-2.71.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make
make check
make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
#### 8.45. Automake-1.16.5
ZZ_FILE='automake-1.16.5.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5

make
make -j4 check
# The test t/subobj.sh is known to fail.
make install

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
##### 8.46. OpenSSL-3.0.5
ZZ_FILE='openssl-3.0.5.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make
make test

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.5

cp -vfr doc/* /usr/share/doc/openssl-3.0.5

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''

###################################################################
####  8.47. Kmod-30
ZZ_FILE='kmod-30.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib


make
make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod

#### Clean up
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
##  8.48. Libelf from Elfutils-0.187
ZZ_FILE='elfutils-0.187.tar.bz2'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.bz2//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy

make
make check

make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.49. Libffi-3.4.2
ZZ_FILE='libffi-3.4.2.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native \
            --disable-exec-static-tramp

make
make check
make install

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.50. Python-3.10.6
ZZ_FILE='Python-3.10.6.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --with-system-ffi    \
            --enable-optimizations

make
make install

####
cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF
####

install -v -dm755 /usr/share/doc/python-3.10.6/html

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.10.6/html \
    -xvf ../python-3.10.6-docs-html.tar.bz2

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.51. Wheel-0.37.1
ZZ_FILE='wheel-0.37.1.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

pip3 install --no-index $PWD

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.52. Ninja-1.11.0
ZZ_FILE='ninja-1.11.0.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

export NINJAJOBS=4

sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc

python3 configure.py --bootstrap

./ninja ninja_test
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.53. Meson-0.63.1
ZZ_FILE='meson-0.63.1.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

pip3 wheel -w dist --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist meson

install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.54. Coreutils-9.1
ZZ_FILE='coreutils-9.1.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

patch -Np1 -i ../coreutils-9.1-i18n-1.patch

autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make
make NON_ROOT_USERNAME=tester check-root

echo "dummy:x:102:tester" >> /etc/group

chown -Rv tester .

su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"
sed -i '/dummy/d' /etc/group

make install

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.55. Check-0.15.2
ZZ_FILE='check-0.15.2.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr --disable-static

make

make check

make docdir=/usr/share/doc/check-0.15.2 install


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.56. Diffutils-3.8
ZZ_FILE='diffutils-3.8.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make

make check

make install


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.57. Gawk-5.1.1
ZZ_FILE='gawk-5.1.1.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make

make check

make install

mkdir -pv  /usr/share/doc/gawk-5.1.1
cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.1


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.58. Findutils-4.9.0
ZZ_FILE='findutils-4.9.0.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac

make

chown -Rv tester .
su tester -c "PATH=$PATH make check"

make install


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.59. Groff-1.22.4
ZZ_FILE='groff-1.22.4.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


PAGE=<paper_size> ./configure --prefix=/usr

make -j1

make install


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.60. GRUB-2.06
ZZ_FILE='grub-2.06.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make

make install

mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.61. Gzip-1.12
ZZ_FILE='gzip-1.12.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


./configure --prefix=/usr

make

make check

make install


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.62. IPRoute2-5.19.0
ZZ_FILE='iproute2-5.19.0.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

make NETNS_RUN_DIR=/run/netns

make SBINDIR=/usr/sbin install

mkdir -pv  /usr/share/doc/iproute2-5.19.0
cp -v COPYING README* /usr/share/doc/iproute2-5.19.0

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.63. Kbd-2.5.1
ZZ_FILE='kbd-2.5.1.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

patch -Np1 -i ../kbd-2.5.1-backspace-1.patch

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

./configure --prefix=/usr --disable-vlock

make

make check

make install

mkdir -pv /usr/share/doc/kbd-2.5.1
cp -R -v docs/doc/* /usr/share/doc/kbd-2.5.1

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.64. Libpipeline-1.5.6
ZZ_FILE='libpipeline-1.5.6.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make
make check
make install

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.65. Make-4.3
ZZ_FILE='make-4.3.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make

make check

make install

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.66. Patch-2.7.6
ZZ_FILE='patch-2.7.6.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


./configure --prefix=/usr

make

make check

make install


cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.67. Tar-1.34
ZZ_FILE='tar-1.34.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr

make

make check

make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.68. Texinfo-6.8
ZZ_FILE='texinfo-6.8.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr

make

make check

make install
make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd

cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.69. Vim-9.0.0228
ZZ_FILE='vim-9.0.0228.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make

# chown -Rv tester .
# su tester -c "LANG=en_US.UTF-8 make -j1 test" &> vim-test.log

make install

ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim90/doc /usr/share/doc/vim-9.0.0228

####
cat > /etc/vimrc << "EOF"
 source $VIMRUNTIME/defaults.vim
 let skip_defaults_vim=1
 set nocompatible
 set backspace=2
 set mouse=
 syntax on
 if (&term == "xterm") || (&term == "putty")
 # set background=dark
 endif
EOF
####

# vim -c ':options'

# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.70. MarkupSafe-2.1.1
ZZ_FILE='MarkupSafe-2.1.1.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


pip3 wheel -w dist --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist Markupsafe


# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.71. Jinja2-3.1.2
ZZ_FILE='Jinja2-3.1.2.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


pip3 wheel -w dist --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist Jinja2


# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.72. Systemd-251
ZZ_FILE='systemd-251.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR


patch -Np1 -i ../systemd-251-glibc_2.36_fix-1.patch

sed -i -e 's/GROUP="render"/GROUP="video"/' \
       -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in

mkdir -p build
cd build

meson --prefix=/usr                 \
      --buildtype=release           \
      -Ddefault-dnssec=no           \
      -Dfirstboot=false             \
      -Dinstall-tests=false         \
      -Dldconfig=false              \
      -Dsysusers=false              \
      -Drpmmacrosdir=no             \
      -Dhomed=false                 \
      -Duserdb=false                \
      -Dman=false                   \
      -Dmode=release                \
      -Dpamconfdir=no               \
      -Ddocdir=/usr/share/doc/systemd-251 \
      ..

ninja

ninja install

tar -xf ../../systemd-man-pages-251.tar.xz --strip-components=1 -C /usr/share/man

systemd-machine-id-setup

systemctl preset-all

systemctl disable systemd-sysupdate


# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.73. D-Bus-1.14.0
ZZ_FILE='dbus-1.14.0.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr                        \
            --sysconfdir=/etc                    \
            --localstatedir=/var                 \
            --runstatedir=/run                   \
            --disable-static                     \
            --disable-doxygen-docs               \
            --disable-xml-docs                   \
            --docdir=/usr/share/doc/dbus-1.14.0 \
            --with-system-socket=/run/dbus/system_bus_socket

make

make install

ln -sfv /etc/machine-id /var/lib/dbus

# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.74. Man-DB-2.10.2
ZZ_FILE='man-db-2.10.2.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr                         \
            --docdir=/usr/share/doc/man-db-2.10.2 \
            --sysconfdir=/etc                     \
            --disable-setuid                      \
            --enable-cache-owner=bin              \
            --with-browser=/usr/bin/lynx          \
            --with-vgrind=/usr/bin/vgrind         \
            --with-grap=/usr/bin/grap
make

make check

make install


# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.75. Procps-ng-4.0.0
ZZ_FILE='procps-ng-4.0.0.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/procps-ng-4.0.0 \
            --disable-static                         \
            --disable-kill                           \
            --with-systemd

make

make check

make install

# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.76. Util-linux-2.38.1
ZZ_FILE='util-linux-2.38.1.tar.xz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.xz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --bindir=/usr/bin    \
            --libdir=/usr/lib    \
            --sbindir=/usr/sbin  \
            --docdir=/usr/share/doc/util-linux-2.38.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python

make

# bash tests/run.sh --srcdir=$PWD --builddir=$PWD
# chown -Rv tester .
# su tester -c "make -k check"

make install

# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.77. E2fsprogs-1.46.5
ZZ_FILE='e2fsprogs-1.46.5.tar.gz'
BASE_DIR=`echo $ZZ_FILE | sed 's/.tar.gz//'`
cd $LFSSRCS
tar -xvf $ZZ_FILE
cd $BASE_DIR

mkdir -v build
cd       build

../configure --prefix=/usr           \
             --sysconfdir=/etc       \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck

make

make check

make install

rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a

gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

makeinfo -o doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

# Cleanup
cd $LFSSRCS
rm -rf $BASE_DIR
ZZ_FILE=''
BASE_DIR=''


###################################################################
## 8.80. Cleaning Up
cd $LFSSRCS

rm -rf /tmp/*

find /usr/lib /usr/libexec -name \*.la -delete

find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf

# You can decide if you want to delete the tester user
## userdel -r tester

echo ".....end of chapter 8....."
