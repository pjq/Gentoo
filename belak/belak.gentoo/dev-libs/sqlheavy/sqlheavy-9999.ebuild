# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit git eutils autotools flag-o-matic

DESCRIPTION="A wrapper on top of SQLite with a GObject-based interface"
HOMEPAGE="http://code.google.com/p/sqlheavy/"
EGIT_REPO_URI="git://gitorious.org/${PN}/${PN}.git"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-db/sqlite
	dev-lang/vala:0.10"
RDEPEND="${DEPEND}"

src_prepare() {
	VALA=valac-0.12 VALA_PACKAGE=libvala-0.12 eautoreconf || die configure failed
	#eautoconf
}

src_compile() {
	sed -i 's/^VALAC = */VALAC = valac-0.10/;s/vala-0.12/vala-0.10/g' Makefile
	emake || die make failed
}

src_install() {
	emake install || die install failed
}
