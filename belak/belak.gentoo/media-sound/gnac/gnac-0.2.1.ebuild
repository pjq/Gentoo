# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit gnome2

DESCRIPTION="An audio converter for GNOME"
HOMEPAGE="http://gnac.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	>=dev-libs/glib-2.14
	>=x11-libs/gtk+-2.8
	>=gnome-base/gconf-2
	>=gnome-base/libgnomeui-2.13
	>=gnome-base/gnome-vfs-2.9
	>=media-libs/gstreamer-0.10.5
	>=gnome-extra/gnome-media-2.11.91
	>=media-libs/gst-plugins-base-0.10
	>=media-plugins/gst-plugins-gconf-0.10
	>=media-plugins/gst-plugins-gnomevfs-0.10
	>=media-plugins/gst-plugins-meta-0.10-r2:0.10"

DEPEND="
	${RDEPEND}
	>=dev-util/pkgconfig-0.9
	>=dev-util/intltool-0.35"

DOCS="AUTHORS ChangeLog NEWS README TODO"

# needed to get around some sandboxing checks
export GST_INSPECT=/bin/true

src_compile()
{
	econf || die "Error: econf failed"
	emake || die "Error: emake failed"
}

src_install()
{
	emake install DESTDIR="${D}" || die "Error: emake install failed"
}
