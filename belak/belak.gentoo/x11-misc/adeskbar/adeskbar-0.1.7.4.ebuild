# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils
DESCRIPTION="A Quick Application Launcher"

HOMEPAGE="http://www.ad-comp.be/index.php?category/ADesk-Bar"

SRC_URI="http://www.ad-comp.be/public/projets/ADeskBar/${P}.tar.bz2"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~x86"

IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${P}"

#src_compile() {
	#econf
	#./configure \
	#	--host=${CHOST} \
	#	--prefix=/usr \
	#	--infodir=/usr/share/info \
	#	--mandir=/usr/share/man || die "./configure failed"
	#emake || die "emake failed"
#}

src_install() {
	#emake DESTDIR="${D}" install || die "emake install failed"

   cd ${S}
   install -d ${D}/usr/{bin,share/${PN},share/pixmaps,share/applications}
   cp -a src/* ${D}/usr/share/${PN}
   install -m 644 ${PN}.png ${D}/usr/share/pixmaps/
   install -m 644 ${PN}.desktop ${D}/usr/share/applications/
#echo -e "#!/bin/bash\nif [ -f ~/.config/$pkgname/config ]; then\n/usr/share/$pkgname/$pkgname\nelse\n \
#/usr/share/$pkgname/$pkgname-conf\n/usr/share/$pkgname/$pkgname\nfi" >$pkgdir/usr/bin/$pkgname
   ln -s /usr/share/${PN}/${PN} ${D}/usr/bin/${PN}
   ln -s /usr/share/${PN}/${PN}-conf ${D}/usr/bin/${PN}-conf
   #chmod 755 ${D}/usr/bin/${PN}


	#emake \
	#	prefix="${D}"/usr \
	#	mandir="${D}"/usr/share/man \
	#	infodir="${D}"/usr/share/info \
	#	libdir="${D}"/usr/$(get_libdir) \
	#	install || die "emake install failed"
	#=
	#einstall || die "einstall failed"
}
