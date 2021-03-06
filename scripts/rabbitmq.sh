#!/bin/bash
#
# Copyright 2013 Ben Cordero
#
# This file is part of lxc-create-gentoo.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
######################
# Bootstrap packages #
######################

_unkeyword() {
    package="$1"
    category=$(echo "$1"|cut -d/ -f1)
    echo "$package" >> "/etc/portage/package.keywords/$category"
}
mkdir -p /etc/portage/package.keywords

_unkeyword net-misc/rabbitmq-server

emerge -f --{use,build}pkg net-misc/rabbitmq-server

##################
# Start services #
##################

rc-update add rabbitmq
rc
