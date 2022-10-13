#!/bin/bash

cd /srv/lzm/lizmap/ || exit

echo "Set repositories and users rights"

echo "Add users and groups"
php scripts/script.php jcommunity~user:create -v --no-error-if-exists user_in_group_a user_in_group_a@nomail.nomail admin
php lizmap/cmd.php acl2group create group_a "group_a"

php lizmap/cmd.php acl2group adduser group_a user_in_group_a
php lizmap/cmd.php acl2right add gobsapi_group "lizmap.repositories.view" "gobsapi"
php lizmap/cmd.php acl2right add admins "lizmap.repositories.view" "gobsapi"

echo "Set view project"
php lizmap/cmd.php acl2right add __anonymous "lizmap.repositories.view" testsrepository
php lizmap/cmd.php acl2right add users "lizmap.repositories.view" testsrepository
php lizmap/cmd.php acl2right add group_a "lizmap.repositories.view" testsrepository
php lizmap/cmd.php acl2right add admins "lizmap.repositories.view" testsrepository

echo "Display WMS links"
php lizmap/cmd.php acl2right add __anonymous "lizmap.tools.displayGetCapabilitiesLinks" testsrepository
php lizmap/cmd.php acl2right add users "lizmap.tools.displayGetCapabilitiesLinks" testsrepository
php lizmap/cmd.php acl2right add group_a "lizmap.tools.displayGetCapabilitiesLinks" testsrepository
php lizmap/cmd.php acl2right add admins "lizmap.tools.displayGetCapabilitiesLinks" testsrepository

echo "Edition"
php lizmap/cmd.php acl2right add __anonymous "lizmap.tools.edition.use" testsrepository
php lizmap/cmd.php acl2right add users "lizmap.tools.edition.use" testsrepository
php lizmap/cmd.php acl2right add group_a "lizmap.tools.edition.use" testsrepository
php lizmap/cmd.php acl2right add admins "lizmap.tools.edition.use" testsrepository

echo "Export layers"
php lizmap/cmd.php acl2right add __anonymous "lizmap.tools.layer.export" testsrepository
php lizmap/cmd.php acl2right add users "lizmap.tools.layer.export" testsrepository
php lizmap/cmd.php acl2right add group_a "lizmap.tools.layer.export" testsrepository
php lizmap/cmd.php acl2right add admins "lizmap.tools.layer.export" testsrepository

echo "See filtered layers"
php lizmap/cmd.php acl2right add admins "lizmap.tools.loginFilteredLayers.override" testsrepository

echo "End of ACL"
