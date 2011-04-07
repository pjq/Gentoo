# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils
DESCRIPTION="A utility to set the name of your window manager"

HOMEPAGE="http://www.suckless.org/programs/wmname.html"
SRC_URI="http://dl.suckless.org/tools/${P}.tar.gz"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/\@strip \$\@/d' Makefile
	sed -i 's/install: all/install:/' Makefile
	sed -i 's/-s //' config.mk
}

#src_compile() {
#	emake
#}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README
}
