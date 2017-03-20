#!/bin/bash

cd /usr/local/bin
sudo ln -s ~/basex/bin/basex

basex -Vc "REPO INSTALL http://files.basex.org/modules/expath/functx-1.0.xar"
cd ~/openinfoman/repo
basex -Vc "repo install csd_base_library.xqm"
basex -Vc "repo install csd_base_library_updating.xqm"
basex -Vc "repo install csd_base_stored_queries.xqm"
basex -Vc "repo install csd_webapp_config.xqm"
basex -Vc "repo install csd_webapp_ui.xqm"
basex -Vc "repo install csd_document_manager.xqm"
basex -Vc "repo install csd_load_sample_directories.xqm"
basex -Vc "repo install csd_query_updated_services.xqm"
basex -Vc "repo install csd_poll_service_directories.xqm"
basex -Vc "repo install csd_local_services_cache.xqm"
basex -Vc "repo install csd_merge_cached_services.xqm"
basex -Vc "repo install csr_processor.xqm"
basex -Vc "repo install svs_load_shared_value_sets.xqm"
basex -Vc "CREATE DATABASE provider_directory"

cd /root/basex/webapp
ln -sf /root/openinfoman/webapp/*xqm .
mkdir -p /root/basex/webapp/static
cd /root/basex/webapp/static
ln -sf /root/openinfoman/webapp/static/* .
