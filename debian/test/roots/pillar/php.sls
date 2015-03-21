## php.ng pillar examples

php:
  ng:
    # global php.ini settings
    ini:
      # Default php.ini contents. These follow a strict format. The top-
      # level dict keys form ini group headings. Nested key/value
      # pairs represent setting=value statements. If a value is a list,
      # its contents will be joined by commas in final rendering.
      defaults:
        PHP:
          expose_php: 'Off'
          allow_url_fopen: 'Off'
          display_errors: 'Off'
          openssl.cafile: 'etc/ssl/certs/ca-certificates.crt'
        Session:
          session.name: 'Session'
          session.cache_limiter: 'nocache'
          session.auto_start: '0'
