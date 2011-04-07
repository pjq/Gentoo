# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils autotools

DESCRIPTION="Generic catalog program"
HOMEPAGE="http://stuffkeeper.org/"
SRC_URI="http://download.sarine.nl/Programs/StuffKeeper/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="spell debug"

DEPEND=">=x11-libs/gtk+-2.10
	>=dev-libs/glib-2.14
	>=dev-db/sqlite-3.4.0
	>=gnome-base/libglade-2.6
	>=dev-util/gob-2.0.10
	dev-util/intltool
	app-crypt/gpgme
	spell? ( app-text/gtkspell )"
RDEPEND="${DEPEND}"

src_configure() {
	econf $(use_enable debug) || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS
}
