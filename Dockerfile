# Apaxy container
# Copyright (C) 2018 Rodrigo Martínez <dev@brunneis.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM brunneis/httpd-centos
MAINTAINER "Rodrigo Martínez" <dev@brunneis.com>

RUN \
    sed -i 's@/opt/httpd/htdocs@/var/www/html@' /opt/httpd/conf/httpd.conf \
    && awk -v n=1 '/AllowOverride None/ { if (++count == n) sub(/None/, "All"); } 1' \
      /opt/httpd/conf/httpd.conf > temp && mv -f temp /opt/httpd/conf/httpd.conf \
    && mkdir -p /var/www/html/theme

COPY .htaccess /var/www/html
COPY theme /var/www/html/theme/
