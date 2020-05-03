{% set user = salt['pillar.get']('remnux_user', 'remnux') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user  %}
{% endif %}

include:
  - remnux.config.user

remnux-config-bash-rc:
  file.managed:
    - name: {{ home }}/.bashrc
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: remnux-user-{{ user }}

remnux-config-bash-rc-noclobber:
  file.append:
    - name: {{ home }}/.bashrc
    - text: 'set -o noclobber'
    - require:
      - user: remnux-user-{{ user }}
    - watch:
      - file: remnux-config-bash-rc