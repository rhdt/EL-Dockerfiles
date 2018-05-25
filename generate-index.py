#!/usr/bin/env python2

import glob
import re
import sys
import yaml

jobs = []
for filename in glob.glob("base/*/Dockerfile"):
    image_name = filename.split('/')[1]

    with open(filename, 'r') as f:
        content = f.read()

    p = re.compile('^FROM\s+([^\s]+)')
    docker_from = p.search(content).group(1)

    docker_from_split = docker_from.split("/")

    docker_from_registry = docker_from_split[0]
    docker_from_image_name = docker_from_split[-1].split(':')[0]

    job = {'image_name': image_name, 'branch_name': 'master'}

    if docker_from_registry == "quay.io":
        kind = "downstream-rhel"
        job['parent_job'] = '%s-master' % (docker_from_image_name,)
    else:
        kind = "base-rhel"

    jobs.append({kind: job})

print open('rhel-index.yaml.head').read()
print yaml.dump([{'project': {'name': 'rhel-build', 'jobs': jobs}}], default_flow_style=False)
