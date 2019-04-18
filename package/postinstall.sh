#!/bin/bash

# Copyright 2014 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This is not meant to be a permanent addition to stenographer, more of a
# hold-over until we can get actual debian packaging worked out.  Also, this
# will probably guide the debian work by detailing all the actual stuff that
# needs to be done to install stenographer correctly.

  echo "Stenographer post-install started..."

  if ! id stenographer >/dev/null 2>&1; then
    sudo adduser --system --no-create-home stenographer
  fi
  if ! getent group stenographer >/dev/null 2>&1; then
    sudo addgroup --system stenographer
  fi

  BINDIR="/usr/bin"
  sudo chmod 0644 /etc/init/stenographer.conf
  sudo chmod 644 /lib/systemd/system/stenographer.service
  sudo chown -R root:stenographer /etc/stenographer/certs
  sudo chown root:stenographer /etc/stenographer/config
  sudo chmod 664 /etc/stenographer/config
  sudo chmod -R 664 /etc/stenographer/certs
  sudo chown root:root /etc/stenographer
  sudo chown root:root ${BINDIR}/steno*
  sudo chown root:root ${BINDIR}/stenoread
  sudo chmod 0775 ${BINDIR}/steno*
  sudo chown stenographer:root ${BINDIR}/stenotype
  sudo chown stenographer:root ${BINDIR}/stenographer

  PCAPDIR="/mnt/sda1/data/stenographer"
  mkdir -p "$PCAPDIR/IDX0"
  mkdir -p "$PCAPDIR/PKT0"
  sudo chown -R stenographer:stenographer ${PCAPDIR}
  sudo chmod ugo+s /usr/bin/stenotype

  echo "Stenographer post-install complete!"

