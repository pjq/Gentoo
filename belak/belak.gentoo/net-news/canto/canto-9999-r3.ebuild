# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PYTHON_DEPEND="2:2.5"

inherit git distutils

DESCRIPTION="Ncurses RSS client"
HOMEPAGE="http://www.codezen.org/canto/"
EGIT_REPO_URI="http://codezen.org/src/${PN}.git"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sys-libs/ncurses
		dev-python/chardet"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}
