# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dmenu/dmenu-4.1.1.ebuild,v 1.2 2010/07/17 10:49:21 jer Exp $

EAPI="2"

inherit toolchain-funcs eutils

DESCRIPTION="a generic, highly customizable, and efficient menu for the X Window System"
HOMEPAGE="http://www.suckless.org/programs/dmenu.html"
SRC_URI="http://dl.suckless.org/tools/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE="xinerama vertical xft"

DEPEND="x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
	xft? ( x11-libs/libXft )"

RDEPEND="${DEPEND}"

src_prepare() {

	use vertical && epatch ${FILESDIR}/dmenu-vertical-history.patch
	use xft && epatch ${FILESDIR}/${P}-xft.patch

	sed -i \
		-e "s/CFLAGS   = -std=c99 -pedantic -Wall -Os/CFLAGS  += -std=c99 -pedantic -Wall -g/" \
		-e "s/LDFLAGS  = -s/LDFLAGS  += -g/" \
		-e "s/XINERAMALIBS  =/XINERAMALIBS  ?=/" \
		-e "s/XINERAMAFLAGS =/XINERAMAFLAGS ?=/" \
		config.mk || die "sed failed"
}

src_compile() {
	if use xinerama; then
		emake CC=$(tc-getCC) || die "emake failed"
	else
		emake CC=$(tc-getCC) XINERAMAFLAGS="" XINERAMALIBS="" \
			|| die "emake failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install || die "emake install failed"

	dodoc README
}

pkg_postinst() {
	einfo "Note that the xft patch has changed and now uses"
	einfo "the default -fn command line option, not -fa"
}
