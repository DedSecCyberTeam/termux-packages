TERMUX_PKG_HOMEPAGE=https://www.ghostscript.com/
TERMUX_PKG_DESCRIPTION="Interpreter for the PostScript language and for PDF"
TERMUX_PKG_VERSION=9.24
TERMUX_PKG_SHA256=bfb448223a0fbec5db60b00fd297557814bca97b66444f2952d209d999ee7b89
TERMUX_PKG_SRCURL=https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${TERMUX_PKG_VERSION//.}/ghostpdl-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_DEPENDS="libandroid-support, libtiff, libjpeg-turbo, libpng, libexpat, freetype, fontconfig, libidn, littlecms, openjpeg"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
ac_cv_lib_lcms2__cmsCreateMutex=yes
CCAUX=gcc
--build=$TERMUX_BUILD_TUPLE
--enable-little-endian
--with-arch_h=$TERMUX_PKG_BUILDER_DIR/arch-${TERMUX_ARCH}.h
--without-pcl
--without-x
--with-system-libtiff
"

termux_step_post_extract_package () {
        rm -rdf $TERMUX_PKG_SRCDIR/{jpeg,libpng,expat,jasper,freetype,lcms2,tiff,openjpeg}
}
