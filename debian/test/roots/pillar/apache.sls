# ``apache`` formula configuration:
apache:
  server: apache2
  service: apache2

  vhostdir: /etc/apache2/sites-available
  confdir: /etc/apache2/conf.d
  confext: .conf
  logdir: /var/log/apache2
  wwwdir: /srv/apache2
  
  # ``apache.vhosts`` formula additional configuration:
  sites:
    000-default: # must be unique; used as an ID declaration in Salt.
      template_file: salt://apache/vhosts/standard.tmpl # or redirect.tmpl or proxy.tmpl

      interface: '*'
      port: '80'

      ServerName: _default_
      ServerAlias: debian.home.lan

      ServerAdmin: webmaster@home.lan

      LogLevel: warn
      ErrorLog: /var/log/apache2/debian.home.lan-error.log
      CustomLog: /var/log/apache2/debian.home.lan-access.log

      DocumentRoot: /var/www/drupal

      Directory:
        # "default" is a special case; Adds ``/path/to/www/dir/example.com``
        # E.g.: /var/www/example.com
        default:
          Options: -Indexes FollowSymLinks
          Order: allow,deny    # For Apache < 2.4
          Allow: from all      # For apache < 2.4
          AllowOverride: None

  modules:
    enabled:
      - ssl
      - rewrite
