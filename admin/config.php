<?php
// HTTP
define('HTTP_SERVER', 'http://dressbib.com/admin/');
define('HTTP_CATALOG', 'http://dressbib.com/');
define('HTTP_IMAGE', 'http://dressbib.com/image/');
define('HTTP_ADMIN', 'http://dressbib.com/admin/');

// HTTPS
define('HTTPS_SERVER', HTTP_SERVER);
define('HTTPS_CATALOG', HTTP_CATALOG);
define('HTTPS_IMAGE', HTTP_IMAGE);
define('HTTPS_ADMIN', HTTP_ADMIN);

// DIR
define('DIR_CATALOG', '/home/woshinn/public_html/catalog/');
define('DIR_APPLICATION', '/home/woshinn/public_html/admin/');
define('DIR_SYSTEM', '/home/woshinn/public_html/system/');
define('DIR_DATABASE', DIR_SYSTEM.'database/');
define('DIR_LANGUAGE', DIR_APPLICATION.'language/');
define('DIR_TEMPLATE', DIR_APPLICATION.'view/template/');
define('DIR_CONFIG', DIR_SYSTEM.'config/');
define('DIR_IMAGE', '/home/woshinn/public_html/image/');
define('DIR_CACHE', DIR_SYSTEM.'cache/');
define('DIR_DOWNLOAD', DIR_SYSTEM.'download/');
define('DIR_UPLOAD', DIR_SYSTEM.'upload/');
define('DIR_LOGS', DIR_SYSTEM.'logs/');
define('DIR_MODIFICATION', DIR_SYSTEM.'modification/');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'dressbibroot');
define('DB_PASSWORD', 'ms1q2w3e4r');
define('DB_DATABASE', 'dressbibopencart');
define('DB_PREFIX', 'oc_');
