# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Simple LaTeX editor for GTK+ users"
HOMEPAGE="http://gummi.midnightcoding.org"
SRC_URI="http://dev.midnightcoding.org/redmine/attachments/download/18/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-python/pygtksourceview-2.4.0
	dev-python/python-poppler
	>=dev-texlive/texlive-latex-2008-r1
	>=dev-texlive/texlive-latexextra-2008-r1
	>=x11-libs/gtk+-2.16.1
	>=x11-libs/pango-1.24.2"
