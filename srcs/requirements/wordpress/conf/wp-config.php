<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', $_ENV['DB_NAME'] );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', $_ENV['DB_USER'] );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', $_ENV['DB_PASSWORD'] );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', $_ENV['DB_HOST'] );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '>9qtr6NOUt0|U8?_[?`|>arhgVWwQ3@gHCbGovbe8HCDocH8q;xo>4ZRr|[D>k[z' );
define( 'SECURE_AUTH_KEY',  ']H- I1JH&w5Eq=9&s9~_AZic4De.V~+`pHHl#?vV.;6H{:+Z%|{a?|} F@V{Q-n5' );
define( 'LOGGED_IN_KEY',    'Xm <Qx:f[lx/pWQVMwjZuLKd#2lSO,EiKC/Xpjy^6*qawoLP9K k@G`6vM^<qP#7' );
define( 'NONCE_KEY',        'f.(Fjw]A6sG+gHv[~`Zf[gPx&W=?UCu=|MmzX&#I:v$;(}Fj%%?sH(?Y0Nr<<*w&' );
define( 'AUTH_SALT',        'KY!7A(yGxabGgD0y{VsM}GU7<AB)v9rlyMVl^O9V9#e}+Ca`fYs gROxjP1D5qhM' );
define( 'SECURE_AUTH_SALT', '-]43kUyC9Pjr:#yir~9 xZ81BI9)dwNs~DEcncy~hjDnk4fFP6F-6]@28KkTn=hz' );
define( 'LOGGED_IN_SALT',   '};5q5P;n,QHhDG>((tYKXodtCX%~>{Y +SD;E|`_PbC-x<dqSC|qDSptB0&]f<nE' );
define( 'NONCE_SALT',       'V.ErQb>FsqtP[dG.s]-<A+k`zz5u[sz4<2PC1FBM#h<_w0vy|*;BS@B(bdU0V?06' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );