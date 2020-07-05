#!/usr/bin/env python3

import os
import subprocess
import sys

# This script populates the dconf settings from respective config files
# Each file name corresponds with the respective dconf path except that '_' is
# used instead of '/' as a delimiter,
# e.g. org_gnome_mutter --> /org/gnome/mutter
with os.scandir("./dconf") as entries:
    for e in entries:
        dconf_path = '/' + e.name.replace('_','/') + '/'
        with open(e) as f:
            try:
                subprocess.run(['dbus-launch', 'dconf', 'load', dconf_path],
                                stdin=f, capture_output=True, check=True)
            except subprocess.CalledProcessError as err:
                print(f'ERROR - {err.cmd}: {err.returncode}\n {err.stdout}\n '
                      '{err.stderr}',
                      file=sys.stderr)
                sys.exit(err.returncode)
