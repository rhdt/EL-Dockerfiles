#!/usr/bin/sh -e

# Required by Dockerfile or any built-time script in hack/
BUILD="python34-pip python2-pip wget"

# - We need postgresql-devel and python3-devel for psycopg2 listed in f8a_worker/requirements.txt
# - We cannot use requests from PyPI since it does not allow us to use own certificates
#   python3-pycurl is needed for Amazon SQS (boto lib), we need Fedora's rpm - installing it from pip results in NSS errors
# - Installing python-requests is a work-around for a conflict which happens when you do
#   'pip install requests; yum install python-requests' (while it's OK if you swap those)
#   It can be removed once gofedlib runs on Python 3.
REQUIREMENTS_TXT='postgresql-devel python34-devel libxml2-devel libxslt-devel python34-requests python-requests python34-pycurl patch'

# hack/run-db-migrations.sh
DB_MIGRATIONS='postgresql'

# f8a_worker/process.py
PROCESS_PY='git unzip zip tar file findutils npm'

# DigesterTask
DIGESTER='ssdeep'

# github-linguist (languages)
# LINGUIST='rubygems ruby-devel'

# oscryptocatcher check from copr repo
# OSCRYPTOCATCHER='oscryptocatcher'

# covscan
# CSMOCK_TASK_DEPS="csmock"

# mercator-go
MERCATOR="mercator-1-25.el7.centos.x86_64"

# CodeMetricsTask - it requires python-pip, since we'll be installing mccabe for both Python 2 and 3
# CODE_METRICS="cloc python-pip"

# OWASP dependency-check used by CVEcheckerTask
DEPENDENCY_CHECK="which"

GOLANG_SUPPORT="golang"

# for pcp pmcd metrics collector
PCP="pcp"


# tagger uses python wrapper above libarchive so install it explicitly
TAGGER_DEP="libarchive"

# Install all RPM deps
yum install -y --setopt=tsflags=nodocs ${BUILD} ${REQUIREMENTS_TXT} \
                ${DB_MIGRATIONS} ${PROCESS_PY} \
                ${DIGESTER} ${LINGUIST} \
                ${OSCRYPTOCATCHER} ${CSMOCK_TASK_DEPS} \
                ${BD_DEPS} ${BREWUTILS} ${MERCATOR} ${CODE_METRICS} \
                ${DEPENDENCY_CHECK} ${GOLANG_SUPPORT} ${PCP} ${TAGGER_DEP}
