require 'formula'

class Recoll < Formula
  homepage 'http://www.recoll.org'
  url 'http://www.lesbonscomptes.com/recoll/recoll-1.19.13.tar.gz'
  sha1 '9e6f9e65c1fd5473d247c773a7a56d462f1b40b2'

  depends_on 'xapian'
  depends_on 'qt'
  def patches
   DATA 
  end
  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/recollindex", "-h"
  end
end

__END__
--- a/configure.orig	2014-01-07 12:39:40.606718201 +0100
+++ b/configure	2014-01-07 12:39:58.574599715 +0100
@@ -5120,7 +5120,7 @@
   # basically to enable using a Macbook for development
   if test X$sys = XDarwin ; then
      # The default is xcode
-     QMAKE="${QMAKE} -spec macx-g++"
+     QMAKE="${QMAKE}"
   fi

   # Discriminate qt3/4. Qt3 qmake prints its version on stderr but we don't

