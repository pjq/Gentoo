# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit mercurial

DESCRIPTION="A semi-automatic tiling window manager"
HOMEPAGE="http://subforge.org/projects/subtle"
SRC_URI=""

EHG_REPO_URI="http://hg.subforge.org/subtle"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug doc xft xinerama xpm xrandr"

RDEPEND="x11-libs/libX11
	dev-lang/ruby:1.9
	dev-vcs/mercurial
	dev-ruby/rake[ruby_targets_ruby19]
	xft? ( x11-libs/libXft )
	xinerama? ( x11-libs/libXinerama )
	xpm? ( x11-libs/libXpm )
	xrandr? ( x11-libs/libXrandr )"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_compile() {
	export XDG_DATA_DIRS="/usr/share"

	if use debug ; then
		my_config="debug=yes"
	else
		my_config="debug=no"
	fi

	if use xft ; then
		my_config="${my_config} xft=yes"
	else
		my_config="${my_config} xft=no"
	fi

	if use xinerama ; then
		my_config="${my_config} xinerama=yes"
	else
		my_config="${my_config} xinerama=no"
	fi

	if use xpm ; then
		my_config="${my_config} xpm=yes"
	else
		my_config="${my_config} xpm=no"
	fi

	if use xrandr ; then
		my_config="${my_config} randr=yes"
	else
		my_config="${my_config} randr=no"
	fi

	rake destdir="${D}" ${my_config} config || die
	rake build || die

	if use doc ; then
		rake rdoc || die
	fi
}

src_install() {
	rake install || die
}
