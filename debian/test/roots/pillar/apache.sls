# ``apache`` formula configuration:
apache:
  server: apache2
  service: apache2

  vhostdir: /etc/apache2/sites-available
  confdir: /etc/apache2/conf.d
  confext: .conf
  logdir: /var/log/apache2
  wwwdir: /srv/apache2

  # ``apache.mod_wsgi`` formula additional configuration:
  # mod_wsgi: mod_wsgi

  # ``apache.vhosts`` formula additional configuration:
  sites:
    debian.home.lan: # must be unique; used as an ID declaration in Salt.
      template_file: salt://apache/vhosts/standard.tmpl # or redirect.tmpl or proxy.tmpl

      ####################### DEFAULT VALUES BELOW ############################
      # NOTE: the values below are simply default settings that *can* be
      # overridden and are not required in order to use this formula to create
      # vhost entries.
      #
      # Do not copy the values below into your Pillar unless you intend to
      # modify these vaules.
      ####################### DEFAULT VALUES BELOW ############################
      template_engine: jinja

      interface: '*'
      port: '80'

      ServerName: debian.home.lan # uses the unique ID above unless specified
      ServerAlias: debian.home.lan

      ServerAdmin: webmaster@home.lan

      LogLevel: warn
      ErrorLog: /var/log/apache2/debian.home.lan-error.log
      CustomLog: /var/log/apache2/debian.home.lan-access.log

      DocumentRoot: /var/www/debian.home.lan

      Directory:
        # "default" is a special case; Adds ``/path/to/www/dir/example.com``
        # E.g.: /var/www/example.com
        default:
          Options: -Indexes FollowSymLinks
          Order: allow,deny    # For Apache < 2.4
          Allow: from all      # For apache < 2.4
          AllowOverride: None
          #Formula_Append: |
          #  Additional config as a
          #  multi-line string here

      # if template is 'redirect.tmpl'
      # RedirectSource: '/'
      # RedirectTarget: 'http://www.example.net'

      # if template is 'proxy.tmpl'
      # ProxyPreserveHost: 'On'
      # ProxyPassSource: '/'
      # ProxyPassTarget: 'http://www.example.net'
      # ProxyPassReverseSource: '/'
      # ProxyPassReverseTarget: 'http://www.example.net'

      #Formula_Append: |
      #  Additional config as a
      #  multi-line string here

  # ``apache.debian_full`` formula additional configuration:
  #register-site:
    # any name as an array index, and you can duplicate this section
    #    001-debian.home.lan:
    #  name: 'debian.home.lan'
    #  path: 'salt://path/to/sites-available/conf/file'
    #  state: 'enabled'
  modules:
    enabled:
      - ssl
      - rewrite
