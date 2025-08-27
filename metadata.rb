name 'cr_docker-ce'
maintainer 'Remi BONNET'
maintainer_email 'prog.bontiv@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures cr_docker-ce'
version '0.1.0'
chef_version '>= 16.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/cr_docker-ce/cr_docker-ce/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/cr_docker-ce/cr_docker-ce'

depends 'docker'
