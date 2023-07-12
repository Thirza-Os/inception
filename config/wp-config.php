<!-- wp-config file Contains website base configuration details. --!>
<!-- If this is not set up correctly: 'Error establishing database'. --!>

<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */

/** @desc this loads the composer autoload file */
require_once dirname( __DIR__ ) . '/vendor/autoload.php';
/** @desc this instantiates Dotenv and passes in our path to .env */
$dotenv = Dotenv\Dotenv::createImmutable(dirname(__DIR__));
$dotenv->load();

/* MySQL settings */
define( 'DB_NAME',     'ThirzaDatabase');
define( 'DB_USER',     $_ENV['WP_USER_ONE']);
define( 'DB_PASSWORD', $_ENV['WP_USER_ONE_PW']);
define( 'DB_HOST',     $_ENV['WP_URL']);
define( 'DB_CHARSET',  'utf8mb4');


/* MySQL database table prefix. */
$table_prefix = 'wp_';

/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

