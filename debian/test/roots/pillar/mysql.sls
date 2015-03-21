mysql:
  server:
    root_password: 'secret'

  # Manage databases
  database:
    - drupal

  # Manage users
  # you can get pillar for existent server using scripts/import_users.py script
  user:
    drupal:
      password: 'secret'
      host: localhost
      databases:
        - database: drupal
          grants: ['all privileges']
          grant_option: True

