#!/usr/bin/env python3

import requests
import sys
from distutils.version import StrictVersion


def versions(package_name):
    url = f"https://pypi.org/pypi/{package_name}/json"
    data = requests.get(url).json()

    versions = []
    for version in data["releases"].keys():
        try:
            StrictVersion(version)
        except ValueError:
            continue

        versions.append(version)
    versions.sort()
    return versions


if len(sys.argv) != 2:
    sys.exit("Expecting 1 argument - package name")

print("\n".join(versions(sys.argv[1])).rstrip())
