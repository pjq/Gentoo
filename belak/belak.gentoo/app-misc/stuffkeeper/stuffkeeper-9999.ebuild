# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git eutils

DESCRIPTION="Stuffkeeper is a generic catalog program."
HOMEPAGE="http://www.stuffkeeper.org"
EGIT_REPO_URI="git://repo.or.cz/stuffkeeper.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug"

DEPEND=">=x11-libs/gtk+-2.10
	>=dev-libs/glib-2.10
	>=dev-db/sqlite-3
	>=gnome-base/libglade-2.6
	dev-util/gob
	dev-util/intltool
	app-crypt/gpgme
	>=dev-lang/vala-0.7.0
	spell? ( app-text/gtkspell )"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

src_configure() {
	if [[ ! -e configure ]] ; then
		./autogen.sh || die "autogen failed"
	fi
}

src_compile() {
	./configure \
		$(use_enable debug) \
		--prefix=/usr
}

src_install() {
	dodoc AUTHORS LICENSE
	emake DESTDIR="${D}" install || die "emake install failed"
}
