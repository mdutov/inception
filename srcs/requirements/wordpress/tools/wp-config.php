<?php

define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', false );
define( 'WP_DEBUG_LOG', true );

define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASSWORD}' );
define( 'DB_HOST', '${DB_HOST}' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );


define('AUTH_KEY',         '~NjZsy)U>;ZNv3FxJn5MzV1c]zEFLcjgiJ.+Ps_OSppYH*{$SqDJ|~KFKkB5sEV2');
define('SECURE_AUTH_KEY',  '4Lr)TeUks{s*W/6R#M}YlEg)ucFU9<bu>yv~g|vLLh.m> W}Xd9}G*>uL} @OcvZ');
define('LOGGED_IN_KEY',    '7-%JhY>lb0a;LI]=NFwZnw^yruA&h6)p|s37&3UrOZV-K7(#f|]2@-o<j]+,Aa_.');
define('NONCE_KEY',        '0LJ+%V9LD^4A+AB<P`+|-n+SC~2I#-ls3XxY/Vt27o-c%Wl,95stD+.3C>,WD1#e');
define('AUTH_SALT',        'ICe^$CH+vVp EYDqY*V&iv1$iZ.HY:ViyS/|v4aVxN;N0=h|7LLV<0|7}q#>xN<g');
define('SECURE_AUTH_SALT', 'pxn6|m{!.:Fh@!/7)PG7* RT@8unT[+?fpTIpO8-=+[vWx&G%*%APyi+&X-LP-xu');
define('LOGGED_IN_SALT',   '/dPgk-qY|nsmgrv85Un].!j=mYU^7H5YC_{$-RFb<cx89^?k)H/m14n:G_OSqI+a');
define('NONCE_SALT',       '3c7{?1588%{M,c;YF2^B|0D0gJy>{}p4mRcP^Pcd2gbdL}`kxU(wB2#4dIeGsVsk');

$table_prefix = 'wp_';

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';